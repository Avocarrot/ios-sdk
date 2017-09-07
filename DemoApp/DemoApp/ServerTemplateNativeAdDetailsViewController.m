//
//  ServerTemplateNativeAdDetailsViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "ServerTemplateNativeAdDetailsViewController.h"

@implementation ServerTemplateNativeAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadAds {
    [super loadAds];
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:self.adUnitId
                                parentViewController:self
                                        templateType:AVONativeAdsTemplateTypeServer
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
