//
//  AVOMRAIDView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 9/13/13.
//  Copyright (c) 2013 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AVOMRAIDView;
@class AVOAd;
@protocol AVOMRAIDServiceDelegate;

// A delegate for MRAIDView to listen for notification on ad ready or expand related events.
@protocol AVOMRAIDViewDelegate <NSObject>

@optional

// These callbacks are for basic banner ad functionality.
- (void)mraidViewAdReady:(AVOMRAIDView *)mraidView;

- (void)mraidViewAdFailed:(AVOMRAIDView *)mraidView;

- (void)mraidViewWillExpand:(AVOMRAIDView *)mraidView;

- (void)mraidViewDidClose:(AVOMRAIDView *)mraidView;

- (void)mraidViewNavigate:(AVOMRAIDView *)mraidView withURL:(NSURL *)url;

- (void)mraidViewWillPresentFullScreenModal:(AVOMRAIDView *)mraidView;

- (void)mraidViewDidPresentFullScreenModal:(AVOMRAIDView *)mraidView;

- (void)mraidViewWillDismissFullScreenModal:(AVOMRAIDView *)mraidView;

- (void)mraidViewDidDismissFullScreenModal:(AVOMRAIDView *)mraidView;

// This callback is to ask permission to resize an ad.
- (BOOL)mraidViewShouldResize:(AVOMRAIDView *)mraidView toPosition:(CGRect)position allowOffscreen:(BOOL)allowOffscreen;

@end


@interface AVOMRAIDView : UIView

@property(nonatomic, weak) id <AVOMRAIDViewDelegate> delegate;
@property(nonatomic, weak) id <AVOMRAIDServiceDelegate> serviceDelegate;
@property(nonatomic, strong, setter = setRootViewController:) UIViewController *rootViewController;
@property(nonatomic, assign, getter = isViewable, setter = setIsViewable:) BOOL isViewable;

@property(nonatomic, strong, readonly) UIViewController *presentedViewController;

// IMPORTANT: This is the only valid initializer for an MRAIDView; -init and -initWithFrame: will throw exceptions
- (id)initWithFrame:(CGRect)frame
       withHtmlData:(NSString *)htmlData
        withBaseURL:(NSURL *)bsURL
             withAd:(AVOAd *)ad
           delegate:(id <AVOMRAIDViewDelegate>)delegate
    serviceDelegate:(id <AVOMRAIDServiceDelegate>)serviceDelegate
 rootViewController:(UIViewController *)rootViewController;

- (id)initWithFrame:(CGRect)frame
       withHtmlData:(NSString *)htmlData
        withBaseURL:(NSURL *)bsURL
             withAd:(AVOAd *)ad
     asInterstitial:(BOOL)isInter
           delegate:(id <AVOMRAIDViewDelegate>)delegate
    serviceDelegate:(id <AVOMRAIDServiceDelegate>)serviceDelegate
 rootViewController:(UIViewController *)rootViewController;

- (void)cancel;

@end
