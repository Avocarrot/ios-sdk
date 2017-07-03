//
//  CustomLayoutNativeAdDetailsViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 20.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "CustomLayoutNativeAdDetailsViewController.h"
#import "NativeBannerView.h"

@interface CustomLayoutNativeAdDetailsViewController ()

@end

@implementation CustomLayoutNativeAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadAds {
    [super loadAds];
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:self.adUnitId
                                parentViewController:self
                             adViewClassForRendering:[NativeBannerView class]
                                             success:^(UIView * _Nonnull adNativeViewContainer) {
                                                __strong __typeof__(self) sSelf = weakSelf;
                                                 [sSelf displayAdWithAdView:adNativeViewContainer];
                                                 NSLog(@"Nativa ad has loaded!");
                                             } failure:^(AVOError *_Nonnull error) {
                                                 NSLog(@"Native ad loading error: %@", [error localizedDescription]);
                                             }];
}

- (void)prepareHeight {
    self.desiredHeight = [NativeBannerView desiredHeight];
}

@end
