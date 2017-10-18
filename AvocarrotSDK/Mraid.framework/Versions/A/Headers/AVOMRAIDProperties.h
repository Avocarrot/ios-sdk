//
//  AVOMRAIDProperties.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 9/16/13.
//  Copyright (c) 2013 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, AVOMRAIDJsPlacementType) {
    AVOMRAIDJsPlacementTypeInline,
    AVOMRAIDJsPlacementTypeInterstitial
};

NSString *AVOMRAIDJsPlacementTypeToString(AVOMRAIDJsPlacementType type);

typedef NS_ENUM(NSUInteger, AVOMRAIDState) {
    AVOMRAIDStateUnknown = 0,
    AVOMRAIDStateDefault,
    AVOMRAIDStateResized,
    AVOMRAIDStateHidden,
    AVOMRAIDStateLoading,
    AVOMRAIDStateExpanded
};

NSString *AVOMRAIDStateToString(AVOMRAIDState state);

typedef NS_ENUM(NSUInteger, AVOMRAIDOrientation) {
    AVOMRAIDOrientationPortrait,
    AVOMRAIDOrientationLandscape,
    AVOMRAIDOrientationNone
};


typedef NS_ENUM(NSUInteger, AVOMRAIDCustomClosePosition) {
    MRAIDCustomClosePositionTopLeft,
    MRAIDCustomClosePositionTopCenter,
    MRAIDCustomClosePositionTopRight,
    MRAIDCustomClosePositionCenter,
    MRAIDCustomClosePositionBottomLeft,
    MRAIDCustomClosePositionBottomCenter,
    MRAIDCustomClosePositionBottomRight
};


static NSString *AVOMRAIDSupportsSMS = @"sms";
static NSString *AVOMRAIDSupportsTel = @"tel";
static NSString *AVOMRAIDSupportsCalendar = @"calendar";
static NSString *AVOMRAIDSupportsStorePicture = @"storePicture";
static NSString *AVOMRAIDSupportsInlineVideo = @"inlineVideo";
static NSString *AVOMRAIDSupportsLocation = @"location";
static NSString *AVOMRAIDSupportsVPAID = @"vpaid";


AVOMRAIDOrientation AVOMRAIDOrientationFromString(NSString *string);

@interface AVOMRAIDOrientationProperties : NSObject

@property(nonatomic, assign) BOOL allowOrientationChange;
@property(nonatomic, assign) AVOMRAIDOrientation forceOrientation;

@end


@interface AVOMRAIDAppOrientation : NSObject

@property(nonatomic, assign) BOOL isLocked;
@property(nonatomic, assign) AVOMRAIDOrientation orientation;
@end

NSString *AVOMRAIDOrientationToString(AVOMRAIDOrientation type);

@interface AVOMRAIDResizeProperties : NSObject

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat offsetX;
@property(nonatomic, assign) CGFloat offsetY;
@property(nonatomic, assign) AVOMRAIDCustomClosePosition customClosePosition;
@property(nonatomic, assign) BOOL allowOffscreen;

+ (AVOMRAIDCustomClosePosition)MRAIDCustomClosePositionFromString:(NSString *)string;

@end

@interface AVOMRAIDExpandProperties : NSObject

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) BOOL useCustomClose;//deprecated
@property(nonatomic, assign) BOOL isModal;

@end

