//
//  AvocarrotSDK+AVOBannerView.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 23/02/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOBannerView.h"

@interface AvocarrotSDK (AVOBanners)

/**
 *  Load banner ads
 *  @param size                     - size of banner, you should choose one of the three available sizes: AVOBannerViewSizeSmall, AVOBannerViewSizeMREC and AVOBannerViewSizeLarge
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - (optional) called when banner is successfully downloaded, returns AVOBannerView
 *  @param failure                  - (optional) called when banner download fails, returns AVOError
 */
- (void)loadBannerWithSize:(AVOBannerViewSize)size
                  adUnitId:(NSString *_Nonnull)adUnitId
                   success:(void (^ _Nullable)(AVOBannerView *_Nonnull bannerAd))success
                   failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

@end
