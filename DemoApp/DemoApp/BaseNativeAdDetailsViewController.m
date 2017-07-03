//
//  BaseNativeAdDetailsViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "BaseNativeAdDetailsViewController.h"
#import "AppControllerManagement.h"

@interface BaseNativeAdDetailsViewController ()
@end

@implementation BaseNativeAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadAds {
    [self.nativeView removeFromSuperview];
    [self prepareHeight];
}

- (void)prepareHeight {
    self.desiredHeight = 0;
}

- (void)displayAdWithAdView:(UIView *)adView {
    self.nativeView = adView;
    if (!self.nativeView.superview) {
        self.nativeView.translatesAutoresizingMaskIntoConstraints = YES;
        self.nativeContainerHeightConstraint.constant = self.desiredHeight;
        [self.adContainerView layoutIfNeeded];
        self.nativeView.frame = self.adContainerView.bounds;
        self.nativeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.adContainerView addSubview:self.nativeView];
        [self.adContainerView layoutIfNeeded];
        [self showBannerWithAnimation: YES];
    }
}

- (void)showBannerWithAnimation:(BOOL)animated {
    self.nativeContainerTopConstraint.constant = -self.nativeContainerHeightConstraint.constant;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];
        }];
    } else {
        [self.view layoutIfNeeded];
    }
}

@end


@interface BaseNativeAdDetailsViewController (AppManagement) <AppControllerManagement>
@end

@implementation BaseNativeAdDetailsViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
    
    [self loadAds];
}

@end




