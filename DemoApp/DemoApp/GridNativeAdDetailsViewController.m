//
//  GridNativeAdDetailsViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "GridNativeAdDetailsViewController.h"

@interface GridNativeAdDetailsViewController ()

@end

@implementation GridNativeAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadAds {
    [super loadAds];
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:self.adUnitId
                                parentViewController:self
                                        templateType:AVONativeAdsTemplateTypeGrid
                                             success:^(UIView * _Nonnull adNativeViewContainer) {
                                                 __strong __typeof__(self) sSelf = weakSelf;
                                                 [sSelf displayAdWithAdView:adNativeViewContainer];
                                                 NSLog(@"Nativa ad has loaded!");
                                             } failure:^(AVOError *_Nonnull error) {
                                                 NSLog(@"Native ad loading error: %@", [error localizedDescription]);
                                             }
                               templateCustomization:nil];
}

- (void)prepareHeight {
    self.desiredHeight = 300;
}

@end
