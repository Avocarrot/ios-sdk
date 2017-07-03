//
//  AvocarrotSDK+AVOTableViewStreamAdapter.m
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04.04.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOTemplateCustomizationObject.h"

@interface AvocarrotSDK (AVOTableViewStreamAdapter)
/**
 *  Add stream adapter for native ads to your UITableView
 *  @param tableView                - UITableView which should contain native ads
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adUnitId                 - your ad unit id
 *  @param templateType             - type of native ads representation template
 *  @param templateCustomization    - (optional) customization for ads representation template
 *
 *  @return AVOTableViewStreamAdapter object which adds native ads to your UITableView and returns original indexPaths
 */
- (AVOTableViewStreamAdapter *_Nonnull)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                                                  parentViewController:(UIViewController *_Nonnull)viewController
                                                              adUnitId:(NSString *_Nonnull)adUnitId
                                                          templateType:(AVONativeAdsTemplateType)templateType
                                                 templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;

/**
 *  Add stream adapter for native ads to your UITableView
 *  @param tableView                - UITableView which should contain native ads
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adUnitId                 - your ad unit id
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *
 *  @return AVOTableViewStreamAdapter object which adds native ads to your UITableView and returns original indexPaths
 */
- (AVOTableViewStreamAdapter *_Nonnull)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                                                  parentViewController:(UIViewController *_Nonnull)viewController
                                                              adUnitId:(NSString *_Nonnull)adUnitId
                                               adViewClassForRendering:(Class _Nonnull)adViewClass;

@end
