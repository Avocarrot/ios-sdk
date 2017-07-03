//
//  BaseNativeAdDetailsViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNativeAdDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView* adContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerTopConstraint;

@property (copy, nonatomic) NSString *adUnitId;
@property (assign, nonatomic) NSUInteger desiredHeight;
@property (strong, nonatomic) UIView *nativeView;

- (void)loadAds;
- (void)prepareHeight;
- (void)displayAdWithAdView:(UIView *)adView;

@end
