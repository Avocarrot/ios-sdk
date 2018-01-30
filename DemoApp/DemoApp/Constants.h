//
//  Constants.h
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstants : NSObject
@property (class, strong, nonatomic, readonly) UIColor *mainColor;
@end

@interface DefaultAdUnitId : NSObject
@property (class, strong, nonatomic, readonly) NSString *bannerAdUnitID;
@property (class, strong, nonatomic, readonly) NSString *interstitialAdUnitID;
@property (class, strong, nonatomic, readonly) NSString *videoAdUnitID;
@property (class, strong, nonatomic, readonly) NSString *nativeAdUnitID;
@property (class, strong, nonatomic, readonly) NSString *nativeAssetsAdUnitID;
@end
