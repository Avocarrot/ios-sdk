//
//  AVOVASTMediaViewController.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 19/07/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AVOVASTMediaViewControllerDelegate, AVOVASTMediaViewControllerInfoSource;

@interface AVOVASTMediaViewController : UIViewController

@property(weak, nonatomic, readonly, nullable) id <AVOVASTMediaViewControllerDelegate> delegate;
@property(weak, nonatomic, readonly, nullable) id <AVOVASTMediaViewControllerInfoSource> infoSource;

+ (_Nonnull instancetype)mediaViewControllerWithVASTStringXML:(NSString *_Nonnull)vastStringXML
                                                     delegate:(id <AVOVASTMediaViewControllerDelegate> _Nullable)delegate
                                                   infoSource:(id <AVOVASTMediaViewControllerInfoSource> _Nullable)infoSource;

+ (_Nonnull instancetype)mediaViewControllerWithVideoURL:(NSURL *_Nonnull)videoURL
                                              htmlString:(NSString *_Nullable)htmlString
                                                delegate:(id <AVOVASTMediaViewControllerDelegate> _Nullable)delegate
                                              infoSource:(id <AVOVASTMediaViewControllerInfoSource> _Nullable)infoSource;

- (void)presentModalyFromViewController:(UIViewController *_Nonnull)viewController;

- (void)freeResources;

@property (assign, nonatomic, readonly) BOOL isReady;
@property (assign, nonatomic, readonly) BOOL hasOwnControls;
@property (copy, nonatomic, readonly, nullable) NSString *vastVersion;
@property (assign, nonatomic) BOOL officialVPAIDSupport;

@property(assign, nonatomic) BOOL shouldShowExitButton;                //default is NO
@property(assign, nonatomic) BOOL supportsAutoRotate;                  //default is NO
@property(assign, nonatomic) BOOL shouldShowTimeline;                  //default is YES
@property(assign, nonatomic) BOOL shouldPauseVideoWhenResignActive;    //default is NO

@property (strong, nonatomic, nonnull) UIImage *exitButtonImage;
@property (strong, nonatomic, nonnull) UIColor *timeLineMinimumTrackTintColor;   //default is [UIColor orangeColor]
@property (strong, nonatomic, nonnull) UIColor *timeLineMaximumTrackTintColor;   //default is [UIColor blackColor]
@property (assign, nonatomic) BOOL looping;
@property (assign, nonatomic) BOOL stopPlayAfterExit;

@end


@protocol AVOVASTMediaViewControllerDelegate <NSObject>

@optional

- (void)mediaViewControllerIsReadyForPresentation:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerVideoDidStart:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerVideoDidFinish:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerVideoDidPause:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerVideoDidPrepareBackground:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerCompanionAdDidShow:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewControllerUserHasToBeRedirectedFrom:(AVOVASTMediaViewController *_Nonnull)mediaViewController withUrl:(NSURL *_Nullable)url;

- (void)mediaViewControllerdidLoadConfig:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (void)mediaViewController:(AVOVASTMediaViewController *_Nonnull)mediaViewController didFailWithError:(AVOVASTError *_Nonnull)error;

- (void)mediaViewController:(AVOVASTMediaViewController *_Nonnull)mediaViewController trackedEvent:(NSString *_Nonnull)name;

- (void)mediaViewControllerDidFullScreenExit:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

@end


@protocol AVOVASTMediaViewControllerInfoSource <NSObject>

@optional

- (BOOL)mediaViewControllerIsCompanionAllowed:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (BOOL)mediaViewControllerIsPrecachingAllowed:(AVOVASTMediaViewController *_Nonnull)mediaViewController;

- (BOOL)mediaViewControllerIsLazyInitAllowed:(AVOVASTMediaViewController *_Nonnull)mediaViewController;
@end
