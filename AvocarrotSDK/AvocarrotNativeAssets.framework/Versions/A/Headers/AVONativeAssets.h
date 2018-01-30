//
//  AVONativeAssets.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 23.12.15.
//  Copyright © 2015 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class AVOAdChoicesModel;

@interface AVONativeAssets : NSObject

@property(nonatomic, copy, nullable) NSString *imageURL;
@property(nonatomic, copy, nullable) NSString *iconURL;
@property(nonatomic, copy, nullable) NSString *text;
@property(nonatomic, copy, nullable) NSString *title;
@property(nonatomic, copy, nullable) NSString *sponsored;
@property(nonatomic, copy, nullable) NSString *callToActionTitle;
@property(nonatomic, copy, nullable) NSString *vastString;
@property(nonatomic, assign) CGFloat starRating;

@property(nonatomic, strong, nullable) AVOAdChoicesModel *adChoices;
@property(nonatomic, strong, nullable) UIImage *adChoicesIcon;

@property(nonatomic, strong, nullable) UIImage *image;
@property(nonatomic, strong, nullable) UIImage *icon;

@end


@interface AVONativeAssets (RegistrateToInteraction)

/**
 Use this method to register container of native ad to interactions

 @param view - container view
 @param subviews - by default, all containers are clickable. If you want to make your container clickable with special subviews, simply add the subviews.

 @return - self
 */
- (instancetype _Nonnull)registerViewForInteraction:(nonnull UIView *)view
                               forClickableSubviews:(nullable NSArray<UIView *> *)subviews;


/**
 (Optional) Use this method to register ad choice container view to auto processing (click handling and transfer to policy web page)

 @param adChoicesView - ad choices container view

 @return - self
 */
- (instancetype _Nonnull)registerAdChoicesView:(nonnull UIView *)adChoicesView;


/**
 Use this method to set the view controller which is used to present ad content modally

 @param  viewController - view controller which is used to present ad content

 @return - self
 */
- (instancetype _Nonnull)setViewControllerForAdPresentation:(nonnull UIViewController *)viewController;

@end


@interface AVONativeAssets (EventRegistration)

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


//NATIVE ASSETS
/*
 Called when ad impression has been counted
 */
extern NSString *_Nonnull const kAVONotification_NativeAssetsImpressed;
/*
 Called when ad click has been counted
 */
extern NSString *_Nonnull const kAVONotification_NativeAssetsClicked;
/*
  Called when leaving the application
 */
extern NSString *_Nonnull const kAVONotification_NativeAssetsLeftApplication;
