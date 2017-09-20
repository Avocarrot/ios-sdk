//
//  AVOBannerView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 23/02/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AVOBannerViewSizeSmall, // (320 x 50)
    AVOBannerViewSizeLarge,  // (728 x 90)
    AVOBannerViewSizeMREC // (300 x 250)
} AVOBannerViewSize;


@interface AVOBannerView : UIView

@property(nonatomic, assign) CGSize adSize;
@property(nonatomic, assign) BOOL autoUpdate;

/**
 *  Dismiss banner
 */
- (void)stop;

/**
 *  Pause auto update of banner
 */
- (void)pauseAutoUpdate;

/**
 *  Resume auto update of banner
 */
- (void)resumeAutoUpdate;

@end


@interface AVOBannerView (EventRegistration)

- (instancetype _Nonnull)onClick:(nullable void (^)(void))block;

@end

//BANNERS
/*
 Called after a click on the banner. After this event the app will be minimized and an external browser will be opened.
 */
extern NSString *_Nonnull const kAVONotification_BannerClicked;
