//
//  BannersDetailViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "BannersDetailViewController.h"
#import "AppControllerManagement.h"

@interface BannersDetailViewController ()

@property(weak, nonatomic) IBOutlet UISwitch *autoupdateSwitch;
@property(strong, nonatomic) AVOBannerView *bannerView;
@end

@implementation BannersDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBanner];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.bannerView resumeAutoUpdate];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.bannerView pauseAutoUpdate];
}

- (void)loadBanner {
    [self.bannerView stop];
    [self.bannerView removeFromSuperview];
    self.bannerView = nil;
    
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadBannerWithSize:self.bannerSize
                                      adUnitId:self.adUnitId
                                       success:^(AVOBannerView * _Nonnull bannerAd) {
                                           __strong __typeof__(self) sSelf = weakSelf;
                                           [sSelf addBannerOnScreen:bannerAd];
                                       }
                                       failure:^(AVOError * _Nonnull error) {
                                           NSLog(@"Banner loading error: %@", [error localizedDescription]);
                                       }];
}

#pragma mark - Actions

- (IBAction)autoupdateSwitched:(UISwitch *)switcher {
    if (self.bannerView) {
        self.bannerView.autoUpdate = switcher.isOn;
    }
}

#pragma mark - Banner ad

- (void)addBannerOnScreen:(AVOBannerView *)newBanner {
    [self.bannerView stop];
    [self.bannerView removeFromSuperview];
    self.bannerView = newBanner;
    
    [self.view addSubview:self.bannerView];
    self.bannerView.autoUpdate = self.autoupdateSwitch.isOn;
    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = @{@"bannerView" : self.bannerView,
                            @"superview" : self.view};
    NSDictionary *metrics = @{@"width" : @(self.bannerView.frame.size.width),
                              @"height" : @(self.bannerView.frame.size.height)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bannerView(==height)]-20-|" options:0 metrics:metrics views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[bannerView(==width)]" options:0 metrics:metrics views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=1)-[bannerView]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
}

@end


@interface BannersDetailViewController (AppManagement) <AppControllerManagement>

@end

@implementation BannersDetailViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
    
    if ([userData[@"bannerType"] isKindOfClass:[NSNumber class]]) {
        self.bannerSize = (AVOBannerViewSize)[(NSNumber *)userData[@"bannerType"] integerValue];
    }
}

@end
