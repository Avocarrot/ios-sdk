//
//  AVONativeView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 1/5/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVOTemplateCustomizationObject.h"


@class AVOStarRatingView, AVOMediaContainerView;

@protocol AVONativeViewInterface <NSObject>

@required

@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *_Nullable avoIconImageView;
@property(weak, nonatomic) IBOutlet AVOMediaContainerView *_Nullable avoMainMediaView;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *_Nullable avoPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet AVOStarRatingView *_Nullable avoRatingStarView;

/**
 *  You should register your custom ad to interaction in order to track clicks and impressions
 *  @param viewController               - UIViewController where your ad is located
 */
- (void)registerViewControllerForInteraction:(UIViewController *_Nonnull)viewController;

/**
 *  You should unregister your custom ad to disable tracking of clicks and impressions, pause video playing and etc
 *  @param viewController               - UIViewController where your ad is located
 */
- (void)unRegisterViewControllerForInteraction:(UIViewController *_Nonnull)viewController;
@end

// SDK can propose to change the controls replacement if some ad data is absent
@protocol AVONativeViewManagementInterface <NSObject>

@optional
/**
 *  Some Ad network adapters could invoke this method after verification of availability of main media data (cover image, video) and propose to rearrange the UI controls on native ad view for the best UI\UX
 *  @param shouldCollapse               - bool value indicates availability of main media data
 */
- (void)collapseMainMediaSpace:(BOOL)shouldCollapse;

/**
 *  Some Ad network adapters could invoke this method after verification of availability of icon data and propose to rearrange the UI controls on native ad view for the best UI\UX
 *  @param shouldCollapse               - bool value indicates availability of icon data
 */
- (void)collapseIconImageSpace:(BOOL)shouldCollapse;

@end


@interface AVONativeView : UIView <AVONativeViewInterface, AVONativeViewManagementInterface>

@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *_Nullable avoIconImageView;
@property(weak, nonatomic) IBOutlet AVOMediaContainerView *_Nullable avoMainMediaView;;
@property(weak, nonatomic) IBOutlet UILabel *_Nullable avoCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *_Nullable avoPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet AVOStarRatingView *_Nullable avoRatingStarView;

+ (NSString *_Nonnull)xibName;

@end

@interface AVOMediaContainerView : UIView

@property(assign, nonatomic) IBInspectable BOOL autoPlay;

@end

@interface AVOStarRatingView : UIView

@property(assign, nonatomic) CGFloat ratingValue;

@end


@interface AVONativeView (EventRegistration)

/**
 Called when ad impression has been counted

 @param impression - callback block
 @return - self
 */
- (instancetype _Nonnull)onImpression:(nullable void (^)(void))impression;


/**
 Called when ad click has been counted

 @param click - callback block
 @return - self
 */
- (instancetype _Nonnull)onClick:(nullable void (^)(void))click;


/**
 Called when leaving the application

 @param leftApplication - callback block
 @return - self
 */
- (instancetype _Nonnull)onLeftApplication:(nullable void (^)(void))leftApplication;

@end
