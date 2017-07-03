//
//  MainViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "MainViewController.h"
#import "Constants.h"
#import "MasterTableItem.h"
#import "MasterTableViewController.h"
#import "CreateAdUnitIdViewController.h"
#import "UserSettings.h"
#import <DZNSegmentedControl/DZNSegmentedControl-umbrella.h>
#import <AvocarrotBanner/AVOBannerView.h>
#import <AvocarrotNativeView/AVONativeView.h>

#import "BannersDetailViewController.h"
#import "InterstitialsDetailViewController.h"
#import "VideoDetailViewController.h"
#import "NativeAdDemonstratorViewController.h"
#import "CreateAdUnitIdViewController.h"

typedef NS_ENUM(NSUInteger, DZDSegmentType) {
    DZDSegmentBanner = 0,
    DZDSegmentInterstitial,
    DZDSegmentVideo,
    DZDSegmentNative
};

@interface UIView (Screenshot)
- (UIImage *)takeScreenshot;
@end

@interface MainViewController (DataSource)
- (void)setDefaultDataSource;
@end

@interface MainViewController () <DZNSegmentedControlDelegate>
@property (weak, nonatomic) IBOutlet DZNSegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *adUnitTextField;
@property (strong, nonatomic) NSArray <MasterTableItem *> * items;
@property (weak, nonatomic) MasterTableViewController *tableVC;
@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self updateRelations];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGSize size = self.scrollView.contentSize;
    CGFloat itemWidth = CGRectGetWidth(self.scrollView.frame);
    self.scrollView.contentSize = CGSizeMake(self.segmentControl.items.count * itemWidth, size.height);
    CGRect rect = self.segmentControl.frame;
    rect.size.width = itemWidth;
    self.segmentControl.frame = rect;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"createAdUnitIdSegue"]) {
        [(CreateAdUnitIdViewController*)segue.destinationViewController setBackgroundImage:[self.view takeScreenshot]];
    }
}

#pragma mark - Action

- (IBAction)didChangeValue:(id)sender {
    [self updateRelations];
}

- (IBAction)btnAddAdUnitTapped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CreateAdUnitIdViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CreateAdUnitIdViewController class])];
    
    __weak typeof(self) weakSelf = self;
    viewController.backBlock = ^(NSString *adUnitID, AdType adType){
        __strong __typeof__(self) sSelf = weakSelf;
        switch (adType) {
            case AdBanner:
                UserSettings.bannerAdUnitID = adUnitID;
                break;
                
            case AdInterstitial:
                UserSettings.interstitialAdUnitID = adUnitID;
                break;
                
            case AdVideo:
                UserSettings.videoAdUnitID = adUnitID;
                break;
                
            case AdNative:
                UserSettings.nativeAdUnitID = adUnitID;
                break;
                
            default:
                break;
        }
        
        [sSelf setDefaultDataSource];
        [sSelf updateRelations];
    };

    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    viewController.modalPresentationStyle =UIModalPresentationOverCurrentContext;
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - Private

- (void)setupUI {
    NSUInteger index = [self.childViewControllers indexOfObjectPassingTest:^BOOL(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return [obj isKindOfClass:[MasterTableViewController class]];
        
    }];
    if (index != NSNotFound) {
        self.tableVC = self.childViewControllers[index];
    }
    
    if (!self.items.count) {
        [self setDefaultDataSource];
    }
    
    [self setupCommonProperties];
    [self setupSegmentControl];
    [self setupAdTypeSelector];
    self.adUnitTextField.userInteractionEnabled = NO;
}

- (void)setupCommonProperties {
    self.navigationController.navigationBar.barTintColor = AppConstants.mainColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = AppConstants.mainColor;
}

- (void)setupSegmentControl {
    NSMutableArray *titles = [NSMutableArray new];
    for (MasterTableItem *item in self.items) {
        [titles addObject:item.title];
    }
    self.segmentControl.items = titles;
    
    self.segmentControl.showsCount = NO;
    self.segmentControl.autoAdjustSelectionIndicatorWidth = NO;
    self.segmentControl.height = 30;
    self.segmentControl.delegate = self;
    self.segmentControl.hairlineColor = [UIColor clearColor];
    self.segmentControl.tintColor = [UIColor whiteColor];
    [self.segmentControl setTitleColor:[UIColor colorWithRed:0.8
                                                       green:0.8
                                                        blue:0.8
                                                       alpha:0.9]
                              forState:UIControlStateNormal];
}

- (void)setupAdTypeSelector {
    self.scrollView.segmentedControl = self.segmentControl;
    self.scrollView.scrollDirection = DZNScrollDirectionHorizontal;
    self.scrollView.scrollOnSegmentChange = YES;
    
    [self fillAdTypes];
}


- (void)fillAdTypes {
    CGFloat offset = 0;
    NSInteger width = CGRectGetWidth(self.scrollView.frame);
    NSInteger height = CGRectGetHeight(self.scrollView.frame);
    UIImageView *previousView = nil;
    
    for (int index = 0; index < self.segmentControl.items.count; index++) {
        UIImageView *imageView = [self createImageViewWithIndex:index];
        imageView.frame = CGRectMake(offset, 0, width, height);
        [self.scrollView addSubview:imageView];
        
        UIScrollView *scrollView = self.scrollView;
        
        [self.scrollView addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView(==scrollView)]|"
                                                 options:0
                                                 metrics:nil
                                                   views:NSDictionaryOfVariableBindings(imageView, scrollView)]];
        
        if (previousView) {
            [self.scrollView addConstraints:
             [NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousView][imageView(==previousView)]"
                                                     options:0
                                                     metrics:nil
                                                       views:NSDictionaryOfVariableBindings(imageView, previousView)]];
        } else {
            [self.scrollView addConstraints:
             [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView(==scrollView)]"
                                                     options:0
                                                     metrics:nil
                                                       views:NSDictionaryOfVariableBindings(imageView, scrollView)]];
        }
        
        offset += width;
        previousView = imageView;
        
        
    }

    [self.scrollView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousView]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"previousView":previousView}]];
    
    self.scrollView.contentSize = CGSizeMake(offset, height);
    self.scrollView.contentOffset = CGPointMake(0, 0);
}

- (UIImageView *)createImageViewWithIndex:(NSUInteger)index{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    if (index < self.items.count) {
        MasterTableItem *item = self.items[index];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.contentMode = UIViewContentModeCenter;
        imageView.backgroundColor = [UIColor clearColor];
        if (item.image) {
            imageView.image = [UIImage imageNamed:item.image];
        }
    }
    
    return imageView;
}

- (void)updateRelations {
    NSUInteger index = self.segmentControl.selectedSegmentIndex;
    [self updateAdUnitID];
    self.tableVC.adItems = [self.items[index] childItems];
    [self.tableVC update];
}

- (void)updateAdUnitID {
    switch ((DZDSegmentType)self.segmentControl.selectedSegmentIndex) {
        case DZDSegmentBanner:
            self.adUnitTextField.text = UserSettings.bannerAdUnitID;
            break;
        
        case DZDSegmentInterstitial:
            self.adUnitTextField.text = UserSettings.interstitialAdUnitID;
            break;
            
        case DZDSegmentVideo:
            self.adUnitTextField.text = UserSettings.videoAdUnitID;
            break;
            
        case DZDSegmentNative:
            self.adUnitTextField.text = UserSettings.nativeAdUnitID;
            break;
            
        default:
            break;
    }
}

#pragma mark - <DZNSegmentedControlDelegate>

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
    return UIBarPositionBottom;
}

@end


@implementation MainViewController (DataSource)

- (void)setDefaultDataSource {
    self.items = @[ [[MasterTableItem alloc] initWithTitle:@"Banner"
                                                withChilds:@[
                        [[MasterTableItem alloc] initWithTitle:@"Standard size (320*50)"
                                                withController:NSStringFromClass([BannersDetailViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"bannerType" : @(AVOBannerViewSizeSmall),
                                                                 @"adUnitId" : UserSettings.bannerAdUnitID
                                                                }],
                        [[MasterTableItem alloc] initWithTitle:@"Tablet size (728*90)"
                                                withController:NSStringFromClass([BannersDetailViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"bannerType" : @(AVOBannerViewSizeLarge),
                                                                 @"adUnitId" : UserSettings.bannerAdUnitID
                                                                 }]
                            ]
                                             withImageName:@"adtype_banner"],
                    
                    [[MasterTableItem alloc] initWithTitle:@"Interstitial"
                                                withChilds:@[
                        [[MasterTableItem alloc] initWithTitle:@"Interstitial"
                                                withController:NSStringFromClass([InterstitialsDetailViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.interstitialAdUnitID}]
                                                            ]
                                             withImageName:@"adtype_interstitial"],
                    
                    [[MasterTableItem alloc] initWithTitle:@"Video"
                                                withChilds:@[
                        [[MasterTableItem alloc] initWithTitle:@"Video"
                                                withController:NSStringFromClass([VideoDetailViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.videoAdUnitID
                                                                }]
                                                            ]
                                             withImageName:@"adtype_video"],
                    
                    [[MasterTableItem alloc] initWithTitle:@"Native"
                                                withChilds:@[
                        [[MasterTableItem alloc] initWithTitle:@"List"
                                                withController:NSStringFromClass([NativeAdDemonstratorViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID,
                                                                 @"template" : @(AVONativeAdsTemplateTypeList)
                                                                }],
                        [[MasterTableItem alloc] initWithTitle:@"Feed"
                                                withController:NSStringFromClass([NativeAdDemonstratorViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID,
                                                                 @"template" : @(AVONativeAdsTemplateTypeFeed)
                                                                 }],
                        [[MasterTableItem alloc] initWithTitle:@"Grid"
                                                withController:NSStringFromClass([NativeAdDemonstratorViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID,
                                                                 @"template" : @(AVONativeAdsTemplateTypeGrid)
                                                                 }],
                        [[MasterTableItem alloc] initWithTitle:@"Custom"
                                                withController:NSStringFromClass([NativeAdDemonstratorViewController class])
                                                   withXibName:nil
                                                    withChilds:nil
                                                  withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID
                                                                }]
                        ]
                                             withImageName:@"adtype_native"],
                  ];
}

@end


@implementation UIView (Screenshot)

- (UIImage *)takeScreenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [[UIScreen mainScreen] scale]);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
