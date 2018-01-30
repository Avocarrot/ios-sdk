//
//  AvocarrotSDK+AVOTableViewStreamAdapter.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04.04.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOTemplateCustomizationObject.h"

@interface AvocarrotSDK (AVOTableViewStreamAdapter)


/**
  Add stream adapter for native ads to your UITableView, which adds native ads and returns original indexPaths

 @param tableView                - UITableView which should contain native ads
 @param viewController           - UIViewController which delegate tableView
 @param adUnitId                 - your ad unit id
 @param templateType             - type of native ads representation template
 @param delegate                 - (optional) delegate of AVOTableViewStreamAdapter
 @param templateCustomization    - (optional) customization for ads representation template
 @param success                  - (optional) called when stream adpater is successfully downloaded, returns stream adapter
 @param failure                  - (optional) called when parameters are invalid, returns AVOError
 */
- (void)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                   parentViewController:(UIViewController *_Nonnull)viewController
                               adUnitId:(NSString *_Nonnull)adUnitId
                           templateType:(AVONativeAdsTemplateType)templateType
                               delegate:(id <AVOTableViewStreamAdapterDelegate> _Nullable)delegate
                  templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization
                                success:(void (^ _Nullable)(AVOTableViewStreamAdapter *_Nonnull streamAdapter))success
                                failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


/**
 Add stream adapter for native ads to your UITableView, which adds native ads and returns original indexPaths

 @param tableView                - UITableView which should contain native ads
 @param viewController           - UIViewController which delegate tableView
 @param adUnitId                 - your ad unit id
 @param templateType             - type of native ads representation template
 @param delegate                 - (optional) delegate of AVOTableViewStreamAdapter
 @param adViewClass              - UIView subclass with your own native ad representation
 @param success                  - (optional) called when stream adpater is successfully downloaded, returns stream adapter
 @param failure                  - (optional) called when parameters are invalid, returns AVOError
 */
- (void)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                   parentViewController:(UIViewController *_Nonnull)viewController
                               adUnitId:(NSString *_Nonnull)adUnitId
                               delegate:(id <AVOTableViewStreamAdapterDelegate> _Nullable)delegate
                adViewClassForRendering:(Class _Nonnull)adViewClass
                                success:(void (^ _Nullable)(AVOTableViewStreamAdapter *_Nonnull streamAdapter))success
                                failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


@end
