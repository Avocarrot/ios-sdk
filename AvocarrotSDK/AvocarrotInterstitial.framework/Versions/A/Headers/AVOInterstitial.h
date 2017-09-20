//
//  AVOInterstitial.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04/03/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVOInterstitial : NSObject

@property(nonatomic, readonly) BOOL ready;

/**
 *  Show interstitial banner modally
 *  @param viewController               - UIViewController for modal presentation
 */
- (void)showFromViewController:(UIViewController *_Nonnull)viewController;

@end


@interface AVOInterstitial (EventRegistration)

- (instancetype _Nonnull)onDidHide:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillHide:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillLoad:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillShow:(nullable void (^)(void))block;

- (instancetype _Nonnull)onDidShow:(nullable void (^)(void))block;

- (instancetype _Nonnull)onClick:(nullable void (^)(void))block;

@end

//FULLSCREENS
/*
 Called after a click on the fullscreen banner. After this event the app will be minimized and an external browser will be opened.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialClicked;
/*
 Called after the fullscreen banner disappears from the screen.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialDidHide;
/*
 Called after the tap on the "close" button, directly before the fullscreen banner disappears.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillHide;
/*
 Called before sending fullscreen banner request to server.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillLoad;
/*
 Called before displaying the fullscreen banner.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialWillShow;
/*
 Called after the fullscreen banner is displayed.
 */
extern NSString *_Nonnull const kAVONotification_InterstitialDidShow;
