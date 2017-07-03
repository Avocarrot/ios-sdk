//
//  AvocarrotSDK+AVONativeView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 07/08/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOTemplateCustomizationObject.h"

@interface AvocarrotSDK (AVONativeView)

/**
 *  Load and render native ad by your own representation template
 *  @param adUnitId                 - your ad unit id
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *  @param success                  - called when native ad successfully is downloaded and rendered, returns rendered UIView
 *  @param failure                  - (optional) called when native ad download fails, returns AVOError
 */
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
            parentViewController:(UIViewController *_Nonnull)viewController
         adViewClassForRendering:(Class _Nonnull)adViewClass
                         success:(void (^ _Nullable)(UIView *_Nonnull adNativeViewContainer))success
                         failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


/**
 *  Load and render native ad by your own representation template
 *  @param adUnitId                 - your ad unit id
 *  @param viewController           - UIViewController which delegate tableView
 *  @param templateType             - type of native ads representation template
 *  @param success                  - called when native ad successfully is downloaded and rendered, returns rendered UIView
 *  @param failure                  - (optional) called when native ad download fails, returns AVOError
 *  @param templateCustomization    - (optional) customization for ads representation template
 */
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
            parentViewController:(UIViewController *_Nonnull)viewController
                    templateType:(AVONativeAdsTemplateType)templateType
                         success:(void (^ _Nullable)(UIView *_Nonnull adNativeViewContainer))success
                         failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure
           templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;


@end
