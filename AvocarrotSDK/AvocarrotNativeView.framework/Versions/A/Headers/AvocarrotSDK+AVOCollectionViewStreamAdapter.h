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
 *  Add stream adapter for native ads to your UICollectionView
 *  @param collectionView           - UICollectionView which should contain native ads
 *  @param viewController           - UIViewController which delegate collectionView
 *  @param adUnitId                 - your ad unit id
 *  @param templateType             - type of native ads representation template
 *  @param delegate                 - delegate of AVOCollectionViewStreamAdapter
 *  @param templateCustomization    - (optional) customization for ads representation template
 *
 *  @return AVOCollectionViewStreamAdapter object which adds native ads to your UICollectionView and returns original indexPaths
 */
- (AVOCollectionViewStreamAdapter *_Nonnull)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                                                            parentViewController:(UIViewController *_Nonnull)viewController
                                                                        adUnitId:(NSString *_Nonnull)adUnitId
                                                                    templateType:(AVONativeAdsTemplateType)templateType
                                                                        delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                                                           templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;

/**
 *  Add stream adapter for native ads to your UICollectionView
 *  @param collectionView           - UICollectionView which should contain native ads
 *  @param viewController           - UIViewController which delegate collectionView
 *  @param adUnitId                 - your ad unit id
 *  @param gridMode                 - set "YES" if you use UICollectionViewFlowLayout, set "NO" if you use you own custom UICollectionViewLayout
 *  @param delegate                 - delegate of AVOCollectionViewStreamAdapter
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *
 *  @return AVOCollectionViewStreamAdapter object which adds native ads to your UICollectionView and returns original indexPaths
 */
- (AVOCollectionViewStreamAdapter *_Nonnull)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                                                            parentViewController:(UIViewController *_Nonnull)viewController
                                                                        adUnitId:(NSString *_Nonnull)adUnitId
                                                              useDefaultGridMode:(BOOL)gridMode
                                                                        delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                                                         adViewClassForRendering:(Class _Nonnull)adViewClass;


@end
