//
//  AVOVideo.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 07/08/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AVOVideo : NSObject

@property (nonatomic, assign, readonly) BOOL ready;

/**
 *  Show fullscreen banner modally
 *  @param viewController               - UIViewController for modal presentation
 */
- (void)showFromViewController:(UIViewController *_Nonnull)viewController;

@end


@interface AVOVideo (EventRegistration)

- (instancetype _Nonnull)onDidHide:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillHide:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillLoad:(nullable void (^)(void))block;

- (instancetype _Nonnull)onWillShow:(nullable void (^)(void))block;

- (instancetype _Nonnull)onDidShow:(nullable void (^)(void))block;

- (instancetype _Nonnull)onPause:(nullable void (^)(void))block;

- (instancetype _Nonnull)onResume:(nullable void (^)(void))block;

- (instancetype _Nonnull)onStart:(nullable void (^)(void))block;

- (instancetype _Nonnull)onComplete:(nullable void (^)(void))block;

- (instancetype _Nonnull)onClick:(nullable void (^)(void))block;

@end


//VIDEOS
/*
 Called when video did hide (is closed).
 */
extern NSString *_Nonnull const kAVONotification_VideoDidHide;
/*
 Called when video will hide (will be closed).
 */
extern NSString *_Nonnull const kAVONotification_VideoWillHide;
/*
 Called before sending video request to server.
 */
extern NSString *_Nonnull const kAVONotification_VideoWillLoad;
/*
 Called when video will show (will be shown).
 */
extern NSString *_Nonnull const kAVONotification_VideoWillShow;
/*
 Called when video did show (is shown).
 */
extern NSString *_Nonnull const kAVONotification_VideoDidShow;
/*
 Called when video is started.
 */
extern NSString *_Nonnull const kAVONotification_VideoStarted;
/*
 Called when video is paused (not implemented yet).
 */
extern NSString *_Nonnull const kAVONotification_VideoPause;
/*
 Called when video is resumed (not implemented yet).
 */
extern NSString *_Nonnull const kAVONotification_VideoResume;
/*
 Called when showing of a video has been completed.
 */
extern NSString *_Nonnull const kAVONotification_VideoCompleted;
/*
 Called after a click on the video. After this event the app will be minimized and an external browser will be opened
 */
extern NSString *_Nonnull const kAVONotification_VideoClicked;

