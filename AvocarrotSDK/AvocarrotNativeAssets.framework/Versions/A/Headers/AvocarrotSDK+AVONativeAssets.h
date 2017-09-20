//
//  AvocarrotSDK+AVONativeAssets.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 23.12.15.
//  Copyright © 2015 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVONativeAssets.h"

@interface AvocarrotSDK (AVONativeAssets)

/**
 *  Load raw native data

 *  @param adUnitId                 - your ad unit id
 *  @param success                  - called when native ad is successfully downloaded, returns AVONativeAssets row data object,
 optional requests UIView where this ad will be rendered (needed for clicks and impressions registration),
 you can register the View for interaction later by using this method of AVONativeAssets:
 - (instancetype _Nonnull)registerViewForInteraction:(nonnull UIView *)view
 forClickableSubviews:(nullable NSArray<UIView *> *)subviews
 *  @param failure                  - (optional) called when native ad download fails, returns AVOError
 */
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
                         success:(UIView *_Nullable (^ _Nonnull)(AVONativeAssets *_Nonnull nativeAssests))success
                         failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


@end
