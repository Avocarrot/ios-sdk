//
//  AVONativeAdsProvider.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 06.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVONativeView;

@interface AVONativeAdsProvider : NSObject

@property(nonatomic, copy, readonly) NSString *_Nullable adUnitId;

/**
 Create immutable provider of native ads. Don't call this method directly. Use specialized class methods from AvocarrotSDK+AVONativeAdsProvider.h

 @param adUnitId - your ad unit id
 @return AVONativeAdsProvider object
 */
+ (instancetype _Nullable)nativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId;


/**
 Load several native ads in ring cache
 
 @param preloadCount - count of native ads for downloading (optimal 1..5)
 @param viewController - UIViewController which delegate UITableView or UICollectionView
 @param successBlock - (optional) called when batch of ads is successfully downloaded, returns AVOBannerView
 @param errorBlock - (optional) called when native ads download fails, returns AVOError
 */
- (void)preloadAdsInCache:(NSInteger)preloadCount
     parentViewController:(UIViewController *_Nonnull)viewController
                  didLoad:(void (^ _Nullable)(NSUInteger preloadCount))successBlock
                  didFail:(void (^ _Nullable)(AVOError *_Nonnull error))errorBlock;


/**
 Get next native ad from ring cache.  Each ad will be repeated through 'preloadCount' interval until it will be tapped or impressed, and as result will be automatically updated. This approach saves user's traffic and maintains fast scrolling of UITableView or UICollectionView
 
 @return View instance which contains rendered native ad
 */
- (AVONativeView *_Nullable)getNextAdView;

@end

