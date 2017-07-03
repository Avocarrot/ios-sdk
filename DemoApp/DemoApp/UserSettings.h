//
//  UserSettings.h
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSettings : NSObject

@property (class, strong, nonatomic) NSString *bannerAdUnitID;
@property (class, strong, nonatomic) NSString *interstitialAdUnitID;
@property (class, strong, nonatomic) NSString *videoAdUnitID;
@property (class, strong, nonatomic) NSString *nativeAdUnitID;

@end
