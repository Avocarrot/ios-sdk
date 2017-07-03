//
//  AvocarrotSDK+AVOInterstitial.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04.04.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOInterstitial.h"

@interface AvocarrotSDK (AVOInterstitial)


/**
 *  Load interstitial ads
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - (optional) called when interstitial is successfully downloaded, returns downloaded interstitial
 *  @param failure                  - (optional) called when interstitial download fails, returns AVOError
 */
- (void)loadInterstitialWithAdUnitId:(NSString *_Nonnull)adUnitId
                             success:(void (^ _Nullable)(AVOInterstitial *_Nonnull interstitial))success
                             failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


/**
 *  Load interstitial ad and show after load with delay which is declared on the server side
 *  @param adUnitId                 - your ad unit id
 *  @param viewController           - UIViewController for modal presentation of interstitial ad
 *  @param success                  - (optional) called when interstitial is successfully downloaded, returns downloaded interstitial
 *  @param failure                  - (optional) called when interstitial download fails, returns AVOError
 */
- (void)loadInterstitialAndShowWithDelayWithAdUnitId:(NSString *_Nonnull)adUnitId
                                   forViewController:(UIViewController *_Nonnull)viewController
                                             success:(void (^ _Nullable)(AVOInterstitial *_Nonnull interstitial))success
                                             failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

@end
