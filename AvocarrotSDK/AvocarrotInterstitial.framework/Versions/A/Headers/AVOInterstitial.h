//
//  AVOInterstitial.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04/03/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVOInterstitial : NSObject

@property(nonatomic, assign, readonly) BOOL ready;

/**
 *  Show interstitial modally
 *  @param viewController - UIViewController for modal presentation
 */
- (void)showFromViewController:(UIViewController *_Nonnull)viewController;

@end


@interface AVOInterstitial (EventRegistration)

/**
 Called after a click on the interstitial. After this event an external browser or a SKStoreProductViewController will be opened.

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onClick:(nullable void (^)(void))block;

/**
 Called after the interstitial disappears from the screen.

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onDidHide:(nullable void (^)(void))block;

/**
 Called after the tap on the "close" button, directly before the interstitial disappears.

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onWillHide:(nullable void (^)(void))block;

/**
 Called before sending interstitial request to server.

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onWillLoad:(nullable void (^)(void))block;

/**
 Called before displaying the interstitial.

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onWillShow:(nullable void (^)(void))block;

/**
 Called after the interstitial is displayed

 @param block - callback block
 @return - self
 */
- (instancetype _Nonnull)onDidShow:(nullable void (^)(void))block;

@end


//INTERSTITIALS
/*
 Called after a click on the interstitial. After this event an external browser or a SKStoreProductViewController will be opened.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialClicked;
/*
 Called after the interstitial disappears from the screen.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialDidHide;
/*
 Called after the tap on the "close" button, directly before the interstitial disappears.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillHide;
/*
 Called before sending interstitial request to server.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillLoad;
/*
 Called before displaying the interstitial.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillShow;
/*
 Called after the interstitial is displayed.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialDidShow;
