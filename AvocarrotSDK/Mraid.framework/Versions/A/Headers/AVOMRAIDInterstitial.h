//
//  AVOMRAIDInterstitial.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 10/18/13.
//  Copyright (c) 2013 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class AVOMRAIDInterstitial, AVOAd;
@protocol AVOMRAIDServiceDelegate;

// A delegate for MRAIDInterstitial to handle callbacks for the interstitial lifecycle.
@protocol AVOMRAIDInterstitialDelegate <NSObject>

@optional

- (void)mraidInterstitialAdReady:(AVOMRAIDInterstitial *)mraidInterstitial;

- (void)mraidInterstitialAdFailed:(AVOMRAIDInterstitial *)mraidInterstitial;

- (void)mraidInterstitialWillShow:(AVOMRAIDInterstitial *)mraidInterstitial;

- (void)mraidInterstitialDidHide:(AVOMRAIDInterstitial *)mraidInterstitial;

- (void)mraidInterstitialNavigate:(AVOMRAIDInterstitial *)mraidInterstitial withURL:(NSURL *)url;

- (void)mraidInterstitialTapped:(AVOMRAIDInterstitial *)mraidInterstitial;

@end

// A class which handles interstitials and offers optional callbacks for its states and services (sms, tel, calendar, etc.)
@interface AVOMRAIDInterstitial : NSObject

@property(nonatomic, weak) id <AVOMRAIDInterstitialDelegate> delegate;
@property(nonatomic, weak) id <AVOMRAIDServiceDelegate> serviceDelegate;
@property(nonatomic, weak, setter = setRootViewController:) UIViewController *rootViewController;
@property(nonatomic, assign, getter = isViewable, setter = setIsViewable:) BOOL isViewable;
@property(nonatomic, copy) UIColor *backgroundColor;

@property(nonatomic, strong, readonly) UIViewController *presentedViewController;

// IMPORTANT: This is the only valid initializer for an MRAIDInterstitial; -init will throw an exception
- (id)initWithSupportedFeatures:(NSArray *)features
                   withHtmlData:(NSString *)htmlData
                    withBaseURL:(NSURL *)bsURL
                         withAd:(AVOAd *)ad
                       delegate:(id <AVOMRAIDInterstitialDelegate>)delegate
                serviceDelegate:(id <AVOMRAIDServiceDelegate>)serviceDelegate
             rootViewController:(UIViewController *)rootViewController;

- (BOOL)isAdReady;

- (void)show;

@end
