//
//  NativeAssetsDetailsViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "NativeAssetsDetailsViewController.h"
#import "NativeAssetsPlusView.h"
#import "AppControllerManagement.h"


@interface NativeAssetsDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIView* adContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerTopConstraint;

@property (weak, nonatomic) UIView *nativeView;
@end

@implementation NativeAssetsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)loadAds {
    __typeof__(self) __weak wSelf = self;
    [AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:self.adUnitId
                                             success:^UIView * _Nonnull(AVONativeAssets *
                                                                        _Nonnull nativeAssets) {
                __typeof__(self) sSelf = wSelf;

                NativeAssetsPlusView *nativeView = [sSelf getNativeAdContainerForNativeAd:nativeAssets];
                NSArray *clickableSubviews = [nativeView clickableSubViews];

                [sSelf.nativeView removeFromSuperview];
                sSelf.nativeView = nativeView;
                                                 
                [sSelf renderAd];

                [[[[nativeAssets onImpression:^{
                    NSLog(@"Native Assets! Impressed");
                }] onClick:^{
                    NSLog(@"Native Assets! Clicked");
                }] onLeftApplication:^{
                    NSLog(@"Native Assets! Left application");
                }] registerViewForInteraction:nativeView
                         forClickableSubviews:clickableSubviews];

                [nativeAssets registerAdChoicesView:nativeView.privacyInfoContainerView];

                return nativeView;
            }
            failure:^(AVOError *_Nonnull error) {
                NSLog(@"Native Assets loading error: %@", [error localizedDescription]);
            }];
}

#pragma mark - Private

- (NativeAssetsPlusView *)getNativeAdContainerForNativeAd:(AVONativeAssets *)ad {

    Class adViewClass = [NativeAssetsPlusView class];
    NSString *className = NSStringFromClass(adViewClass);

    NativeAssetsPlusView *nativeAdContainer = (NativeAssetsPlusView *) [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil][0];
    [nativeAdContainer fillWithNativeAd:ad];

    return nativeAdContainer;
}


- (void)renderAd {
    if (![self.nativeView superview]) {
        self.nativeContainerHeightConstraint.constant = 300;
        [self.adContainerView layoutIfNeeded];

        self.nativeView.frame = self.adContainerView.bounds;
        self.nativeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.adContainerView addSubview:self.nativeView];
        [self.adContainerView layoutIfNeeded];

        [self showBannerWithAnimation:YES];
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


@interface NativeAssetsDetailsViewController (AppManagement) <AppControllerManagement>
@end

@implementation NativeAssetsDetailsViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
    
    [self loadAds];
}

@end
