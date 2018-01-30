//
//  AvocarrotSDK+AVOCollectionViewStreamAdapter.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOCollectionViewStreamAdapter.h"
#import "AVOTemplateCustomizationObject.h"

@interface AvocarrotSDK (AVOCollectionViewStreamAdapter)

/**
 Add stream adapter for native ads to your UICollectionView, which adds native ads and returns original indexPaths

 @param collectionView          - UICollectionView which should contain native ads
 @param viewController          - UIViewController which delegate collectionView
 @param adUnitId                - your ad unit id
 @param templateType            - type of native ads representation template
 @param delegate                - delegate of AVOCollectionViewStreamAdapter
 @param templateCustomization   - (optional) customization for ads representation template
 @param success                 - (optional) called when stream adpater is successfully downloaded, returns stream adapter
 @param failure                 - (optional) called when parameters are invalid, returns AVOError
 */
- (void)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                        parentViewController:(UIViewController *_Nonnull)viewController
                                    adUnitId:(NSString *_Nonnull)adUnitId
                                templateType:(AVONativeAdsTemplateType)templateType
                                    delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                       templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization
                                     success:(void (^ _Nullable)(AVOCollectionViewStreamAdapter *_Nonnull streamAdapter))success
                                     failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


/**
 Add stream adapter for native ads to your UICollectionView, which adds native ads and returns original indexPaths. UICollectionView must use UICollectionViewFlowLayout.

 @param collectionView          - UICollectionView which should contain native ads
 @param viewController          - UIViewController which delegate collectionView
 @param adUnitId                - your ad unit id
 @param delegate                - delegate of AVOCollectionViewStreamAdapter
 @param adViewClass             - UIView subclass with your own native ad representation
 @param success                 - (optional) called when stream adpater is successfully downloaded, returns stream adapter
 @param failure                 - (optional) called when parameters are invalid, returns AVOError
 */
- (void)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                        parentViewController:(UIViewController *_Nonnull)viewController
                                    adUnitId:(NSString *_Nonnull)adUnitId
                                    delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                     adViewClassForRendering:(Class _Nonnull)adViewClass
                                     success:(void (^ _Nullable)(AVOCollectionViewStreamAdapter *_Nonnull streamAdapter))success
                                     failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


#pragma mark - Deprecated methods will be supported until major release

/**
 Add stream adapter for native ads to your UICollectionView, which adds native ads and returns original indexPaths

 @param collectionView          - UICollectionView which should contain native ads
 @param viewController          - UIViewController which delegate collectionView
 @param adUnitId                - your ad unit id
 @param gridMode                - set "YES" if you use UICollectionViewFlowLayout, set "NO" if you use you own custom UICollectionViewLayout
 @param delegate                - delegate of AVOCollectionViewStreamAdapter
 @param adViewClass             - UIView subclass with your own native ad representation
 @param success                 - (optional) called when stream adpater is successfully downloaded, returns stream adapter
 @param failure                 - (optional) called when parameters are invalid, returns AVOError
 */
- (void)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                        parentViewController:(UIViewController *_Nonnull)viewController
                                    adUnitId:(NSString *_Nonnull)adUnitId
                          useDefaultGridMode:(BOOL)gridMode
                                    delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                     adViewClassForRendering:(Class _Nonnull)adViewClass
                                     success:(void (^ _Nullable)(AVOCollectionViewStreamAdapter *_Nonnull streamAdapter))success
                                     failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure __deprecated_msg("This method is deprecated, please, use method without `useDefaultGridMode` param");



@end
