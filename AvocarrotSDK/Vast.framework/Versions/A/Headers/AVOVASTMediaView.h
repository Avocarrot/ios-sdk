//
//  AVOVASTMediaView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 19/07/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AVOVASTMediaViewDelegate, AVOVASTMediaViewInfoSource;
@class AVOVASTError;

@interface AVOVASTMediaView : UIView

@property(weak, nonatomic, readonly, nullable) id <AVOVASTMediaViewDelegate> delegate;
@property(weak, nonatomic, readonly, nullable) id <AVOVASTMediaViewInfoSource> infoSource;

+ (_Nonnull instancetype)mediaViewWithFrame:(CGRect)frame
                              VASTStringXML:(NSString *_Nonnull)vastStringXML
                                   delegate:(id <AVOVASTMediaViewDelegate> _Nullable)delegate
                                 infoSource:(id <AVOVASTMediaViewInfoSource> _Nullable)infoSource;

+ (_Nonnull instancetype)mediaViewWithFrame:(CGRect)frame
                                   videoURL:(NSURL *_Nonnull)videoURL
                                 htmlString:(NSString *_Nullable)htmlString
                                   delegate:(id <AVOVASTMediaViewDelegate> _Nullable)delegate
                                 infoSource:(id <AVOVASTMediaViewInfoSource> _Nullable)infoSource;

- (void)freeResources;

- (void)prepare;

- (void)play;

- (void)pause;

- (void)stop;

- (void)mute;

- (void)unmute;

@property(assign, nonatomic, readonly) BOOL isReady;

@property(assign, nonatomic) BOOL shouldShowFullscreenButton;          //default is YES
@property(assign, nonatomic) BOOL shouldShowTimeline;                  //default is YES

@property(assign, nonatomic) BOOL shouldShowExitButton;               //default is YES
@property(assign, nonatomic) BOOL shouldShowReplayButton;             //default is NO
@property(assign, nonatomic) BOOL shouldShowFadeScreenAfterFinish;    //default is NO

@property(assign, nonatomic) BOOL stopPlayAfterCollapse;

@property(strong, nonatomic, nonnull) UIColor *timeLineMinimumTrackTintColor;   //default is [UIColor orangeColor]
@property(strong, nonatomic, nonnull) UIColor *timeLineMaximumTrackTintColor;   //default is [UIColor blackColor]

@property(assign, nonatomic) BOOL looping; //default is NO

@end


@protocol AVOVASTMediaViewDelegate <NSObject>

@optional

- (void)mediaViewIsReadyForPresentation:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewVideoDidStart:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewVideoDidFinish:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewVideoDidPause:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewVideoDidPrepareBackground:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewCompanionAdDidShow:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewUserHasToBeRedirectedFrom:(AVOVASTMediaView *_Nonnull)mediaView withUrl:(NSURL *_Nullable)url;

- (void)mediaView:(AVOVASTMediaView *_Nonnull)mediaView didFailWithError:(AVOVASTError *_Nonnull)error;

- (void)mediaViewVideoExpandsToFullscreen:(AVOVASTMediaView *_Nonnull)mediaView;

- (void)mediaViewVideoCollapsesFromFullscreen:(AVOVASTMediaView *_Nonnull)mediaView;

@end


@protocol AVOVASTMediaViewInfoSource <NSObject>

@optional

- (BOOL)mediaViewIsCompanionAllowed:(AVOVASTMediaView *_Nonnull)mediaView;

- (BOOL)mediaViewIsPrecachingAllowed:(AVOVASTMediaView *_Nonnull)mediaView;

- (BOOL)mediaViewIsLazyInitAllowed:(AVOVASTMediaView *_Nonnull)mediaView;

@end
