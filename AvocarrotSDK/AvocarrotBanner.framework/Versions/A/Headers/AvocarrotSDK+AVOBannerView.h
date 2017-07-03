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
 *  @param size                     - size of banner, you should choose between two sizes: AVOBannerViewSizeSmall and AVOBannerViewSizeLarge
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - (optional) called when banner is successfully downloaded, returns AVOBannerView
 *  @param failure                  - (optional) called when banner download fails, returns AVOError
 *
 *  @return AVOBannerView object which you should add to your banner place on screen
 */
- (AVOBannerView *_Nullable)loadBannerWithSize:(AVOBannerViewSize)size
                                      adUnitId:(NSString *_Nonnull)adUnitId
                                       success:(void (^ _Nullable)(AVOBannerView *_Nonnull bannerAd))success
                                       failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

@end
