//
//  AVOTemplateCustomizationObject.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 19/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AVONativeAdsTemplateType) {
    AVONativeAdsTemplateTypeNo = -1,
    AVONativeAdsTemplateTypeList = 0,
    AVONativeAdsTemplateTypeFeed,
    AVONativeAdsTemplateTypeGrid,
    AVONativeAdsTemplateTypeGridIcon,
    AVONativeAdsTemplateTypeServer
};

typedef NS_ENUM(NSInteger, AVONativeLabelTextStyle) {
    AVONativeLabelTextStyleDefault = 0,
    AVONativeLabelTextStyleCapitalize,
    AVONativeLabelTextStyleUppercase,
    AVONativeLabelTextStyleLowercase,
};


@interface AVOTemplateCustomizationObject : NSObject

NS_ASSUME_NONNULL_BEGIN

@property(nonatomic, strong) UIColor *_Nonnull avoBackgroundColor;

/*
 Customization of the title label
 */
@property(nonatomic, strong) UIFont *_Nonnull avoTitleFont;
@property(nonatomic, strong) UIColor *_Nonnull avoTitleColor;
@property(nonatomic, assign) AVONativeLabelTextStyle avoTitleTextStyle;
@property(nonatomic, assign) CGFloat avoTitleLeftOffset;
@property(nonatomic, assign) CGFloat avoTitleRightOffset;
/*
Customization of the description label
 */
@property(nonatomic, strong) UIFont *_Nonnull avoDescriptionTextFont;
@property(nonatomic, strong) UIColor *_Nonnull avoDescriptionTextColor;
@property(nonatomic, assign) CGFloat avoDescriptionTextLeftOffset;
@property(nonatomic, assign) CGFloat avoDescriptionTextRightOffset;


/*
 Customization of the cover media view
 */

@property(nonatomic, assign) CGFloat avoCoverMediaLeftOffset;
@property(nonatomic, assign) CGFloat avoCoverMediaRightOffset;
@property(nonatomic, assign) CGFloat avoCoverMediaTopOffset;
@property(nonatomic, assign) CGFloat avoCoverMediaBottomOffset;
@property(nonatomic, assign) CGFloat avoCoverMediaCornerRadius;
@property(nonatomic, assign) BOOL avoCoverMediaAutoPlayEnabled;

/*
 Customization of the CTA button
 */
@property(nonatomic, strong) UIFont *_Nonnull avoCTAFont;
@property(nonatomic, strong) UIColor *_Nonnull avoCTAColor;
@property(nonatomic, strong) UIColor *_Nonnull avoCTATextColor;
@property(nonatomic, assign) AVONativeLabelTextStyle avoCTATextStyle;
@property(nonatomic, strong) UIColor *_Nonnull avoCTABorderColor;
@property(nonatomic, assign) CGFloat avoCTACornerRadius;
@property(nonatomic, assign) CGFloat avoCTABorderWidth;
@property(nonatomic, assign) CGFloat avoCTARightOffset;
@property(nonatomic, assign) CGFloat avoCTABottomOffset;

/*
 Customization of the sponsored label
 */
@property(nonatomic, strong) UIFont *_Nonnull avoSponsoredFont;
@property(nonatomic, strong) UIColor *_Nonnull avoSponsoredColor;
@property(nonatomic, assign) AVONativeLabelTextStyle avoSponsoredTextStyle;

/*
 Customization of the icon
 */
@property(nonatomic, assign) CGFloat avoIconLeftOffset;
@property(nonatomic, assign) CGFloat avoIconTopOffset;
@property(nonatomic, assign) CGFloat avoIconHeight;
@property(nonatomic, assign) CGFloat avoIconWidth;
@property(nonatomic, assign) CGFloat avoIconCornerRadius;
@property(nonatomic, assign) UIViewContentMode avoIconContentMode;

/*
 Customization of the grid template
 */
@property(nonatomic, assign) CGFloat avoMediaContentRatio;//from 0 to 1
@property(nonatomic, assign) CGFloat avoTextContentRatio;//from 0 to 1

/*
 Customization of the grid icon template
 */
@property(nonatomic, assign) CGFloat avoGridIconTemplateTitleIconBottomOffest;
@property(nonatomic, assign) CGFloat avoGridIconTemplateIconCTATopOffset;


NS_ASSUME_NONNULL_END


@end
