//
//  AvocarrotSDK+AVONativeAdsProvider.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 06.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOTemplateCustomizationObject.h"
#import "AVONativeAdsProvider.h"

@interface AvocarrotSDK (AVONativeAdsProvider)

/**
 Add native ads provider for UITableView or UICollectionView as more flexible approach instead
     of the completed stream adapter classes (AVOTableViewStreamAdapter or AVOCollectionViewStreamAdapter)
 
 @param adUnitId - your ad unit id
 @param templateType - type of native ads representation template
 @param templateCustomization - (optional) customization for ads representation template
 @return AVONativeAdsProvider object which preloads native ads and provided rendered ad views. Generaly it works as ring data structure.
 */
- (AVONativeAdsProvider *_Nonnull)createNativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId
                                                      templateType:(AVONativeAdsTemplateType)templateType
                                             templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;

/**
 Add native ads provider for UITableView or UICollectionView as more flexible approach instead
 of the completed stream adapter classes (AVOTableViewStreamAdapter or AVOCollectionViewStreamAdapter)
 
 @param adUnitId - your ad unit id
 @param adViewClass - UIView subclass with your own native ad representation
 @return AVONativeAdsProvider object which preloads native ads and provided rendered ad views. Generaly it works as ring data structure.
 */
- (AVONativeAdsProvider *_Nonnull)createNativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId
                                           adViewClassForRendering:(Class _Nonnull)adViewClass;

@end
