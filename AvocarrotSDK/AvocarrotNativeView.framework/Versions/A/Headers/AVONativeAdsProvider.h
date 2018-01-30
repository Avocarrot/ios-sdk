//
//  AVONativeAdsProvider.h
//  AvocarrotSDK
//
//  Created by Siarhei Barmotska on 06.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVONativeView;

@interface AVONativeAdsProvider : NSObject

@property (nonatomic, copy, readonly) NSString * _Nullable adUnitId;
@property (copy, nonatomic, readonly) NSDictionary <NSString *, id> * _Nullable userData;

/**
 Load several native ads in ring cache
 
 @param preloadCount - count of native ads for downloading (optimal 1..5)
 @param viewController - UIViewController which delegate UITableView or UICollectionView
 @param successBlock - (optional) called when batch of ads is successfully downloaded, returns amount of ads
 @param errorBlock - (optional) called when native ads download fails, returns AVOError
 */
- (void)preloadAdsInCache:(NSUInteger)preloadCount
     parentViewController:(UIViewController *_Nonnull)viewController
                  didLoad:(void (^ _Nullable)(NSUInteger preloadCount))successBlock
                  didFail:(void (^ _Nullable)(AVOError *_Nonnull error))errorBlock;


/**
Get next native ad from the ring cache. Each ad will be inserted repeatedly every 'preloadCount' interval
until it's tapped or impression is counted and as result ad is automatically replaced with a new one.
 
 @return View instance which contains rendered native ad
 */
- (AVONativeView* _Nullable)getNextAdView;


#pragma mark - Deprecated methods will be supported until major release

+ (instancetype _Nullable)nativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId __deprecated_msg("Use extended  \'nativeAdsProviderForAdunit:..\' method with \'userData\' parameter.");

@end

