//
//  NativeAdDemonstratorViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "NativeAdDemonstratorViewController.h"
#import "MasterTableItem.h"
#import "UserSettings.h"
#import "AppControllerManagement.h"
#import <DZNSegmentedControl/DZNSegmentedControl-umbrella.h>

#import "ListTableViewController.h"
#import "FeedTableViewController.h"
#import "ListFlowLayoutCollectionViewController.h"
#import "FeedFlowLayoutCollectionViewController.h"
#import "GridFlowLayoutCollectionViewController.h"

@interface NativeAdDemonstratorViewController () <DZNSegmentedControlDelegate>

@property (weak, nonatomic) IBOutlet DZNSegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) UIViewController *activeVC;

@end

@implementation NativeAdDemonstratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self updateDemonstrationView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect rect = self.segmentControl.frame;
    rect.size.width = CGRectGetWidth(self.view.frame);;
    self.segmentControl.frame = rect;
}

#pragma mark - Action

- (IBAction)didChangeValue:(id)sender {
    [self updateDemonstrationView];
}

#pragma mark - Private

- (void)setupUI {
    [self setupSegmentControl];
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

- (void)updateDemonstrationView {
    MasterTableItem *item = self.items[self.segmentControl.selectedSegmentIndex];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController;
    if (item.controller && item.xibName) {
        Class class = NSClassFromString(item.controller);
        viewController = [[class alloc] initWithNibName:item.xibName bundle:[NSBundle mainBundle]];
    } else if (item.controller) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:item.controller];
    } else if (item.childItems.count > 0) {
        NativeAdDemonstratorViewController *nativeController = (NativeAdDemonstratorViewController*)[storyboard instantiateViewControllerWithIdentifier:@"NativeAdDemonstratorViewController"];
        nativeController.items = item.childItems;
        nativeController.title = item.title;
        viewController = nativeController;
    }
    
    if ([viewController conformsToProtocol:@protocol(AppControllerManagement)] &&
        [viewController respondsToSelector:@selector(applyUserData:)]) {
        [(UIViewController<AppControllerManagement> *)viewController applyUserData:item.userData];
    }
    
    if (viewController) {
        [self displayContentController:viewController];
    }
}

- (void)displayContentController:(UIViewController *)contentVC {
    [self addChildViewController:contentVC];
    contentVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:contentVC.view];
    [contentVC didMoveToParentViewController:self];
    
    [self.activeVC.view removeFromSuperview];
    [self.activeVC removeFromParentViewController];
    self.activeVC = contentVC;
}


#pragma mark - <DZNSegmentedControlDelegate>

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
    return UIBarPositionBottom;
}

@end


@interface NativeAdDemonstratorViewController (DataSource)

- (NSArray <MasterTableItem *> *)supportedPresentationsForTemplate:(AVONativeAdsTemplateType)type;
- (NSArray <MasterTableItem *> *)supportedPresentationsForCustomisation;
@end

@implementation NativeAdDemonstratorViewController (DataSource)

- (NSArray <MasterTableItem *> *)supportedPresentationsForTemplate:(AVONativeAdsTemplateType)template {
    switch (template) {
        case AVONativeAdsTemplateTypeList:
            return @[ [[MasterTableItem alloc] initWithTitle:@"CollectionView"
                                              withController:NSStringFromClass([ListFlowLayoutCollectionViewController class])
                                                 withXibName:@"BaseCollectionViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
                      [[MasterTableItem alloc] initWithTitle:@"TableView"
                                              withController:NSStringFromClass([ListTableViewController class])
                                                 withXibName:@"BaseTableViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
                      [[MasterTableItem alloc] initWithTitle:@"Single Native"
                                              withController:@"ListNativeAdDetailsViewController"
                                                 withXibName:@"BaseNativeAdDetailsViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}]
                    ];
            
        case AVONativeAdsTemplateTypeFeed:
            return @[ [[MasterTableItem alloc] initWithTitle:@"CollectionView"
                                              withController:NSStringFromClass([FeedFlowLayoutCollectionViewController class])
                                                 withXibName:@"BaseCollectionViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
                      [[MasterTableItem alloc] initWithTitle:@"TableView"
                                              withController:NSStringFromClass([FeedTableViewController class])
                                                 withXibName:@"BaseTableViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
                      [[MasterTableItem alloc] initWithTitle:@"Single Native"
                                              withController:@"FeedNativeAdDetailsViewController"
                                                 withXibName:@"BaseNativeAdDetailsViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}]
                      ];
            
        case AVONativeAdsTemplateTypeGrid:
            return @[ [[MasterTableItem alloc] initWithTitle:@"CollectionView"
                                              withController:NSStringFromClass([GridFlowLayoutCollectionViewController class])
                                                 withXibName:@"BaseCollectionViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
                      [[MasterTableItem alloc] initWithTitle:@"Single Native"
                                              withController:@"GridNativeAdDetailsViewController"
                                                 withXibName:@"BaseNativeAdDetailsViewController"
                                                  withChilds:nil
                                                withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}]
                      ];
            
        default:
            return @[];
    }
}

- (NSArray <MasterTableItem *> *)supportedPresentationsForCustomisation {
    return @[ [[MasterTableItem alloc] initWithTitle:@"Native Assets"
                                      withController:@"NativeAssetsDetailsViewController"
                                         withXibName:nil
                                          withChilds:nil
                                        withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
              [[MasterTableItem alloc] initWithTitle:@"Custom Layout"
                                      withController:@"CustomLayoutNativeAdDetailsViewController"
                                         withXibName:@"BaseNativeAdDetailsViewController"
                                          withChilds:nil
                                        withUserData:@{@"adUnitId" : UserSettings.nativeAdUnitID}],
              
            ];
}


@end


@interface NativeAdDemonstratorViewController (AppManagement) <AppControllerManagement>
@end

@implementation NativeAdDemonstratorViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
    
    if ([userData[@"template"] isKindOfClass:[NSNumber class]]) {
        self.items = [self supportedPresentationsForTemplate: (AVONativeAdsTemplateType)[(NSNumber*)userData[@"template"] integerValue]];
    } else {
        self.items = [self supportedPresentationsForCustomisation];
    }
}

@end
