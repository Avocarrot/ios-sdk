//
//  UserSettings.m
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "UserSettings.h"
#import "Constants.h"

static NSString *const kUSCurrentBannerAdUnitIdKey = @"kUSCurrentBannerAdUnitIdKey";
static NSString *const kUSCurrentInterstitialAdUnitIdKey = @"kUSCurrentInterstitialAdUnitIdKey";
static NSString *const kUSCurrentVideoAdUnitIdKey = @"kUSCurrentVideoAdUnitIdKey";
static NSString *const kUSCurrentNativeAdUnitIdKey = @"kUSCurrentNativeAdUnitIdKey";
static NSString *const kUSCurrentNativeAssetsAdUnitIdKey = @"kUSCurrentNativeAssetsAdUnitIdKey";

@implementation UserSettings

+ (NSString*)bannerAdUnitID {
    return [self getUserDefaultsValueForKey:kUSCurrentBannerAdUnitIdKey] ?: DefaultAdUnitId.bannerAdUnitID;
}

+ (void)setBannerAdUnitID:(NSString *)bannerAdUnitID {
    [self setUserDefaultsValue:bannerAdUnitID forKey:kUSCurrentBannerAdUnitIdKey];
}


+ (NSString*)interstitialAdUnitID {
    return [self getUserDefaultsValueForKey:kUSCurrentInterstitialAdUnitIdKey] ?:  DefaultAdUnitId.interstitialAdUnitID;
}

+ (void)setInterstitialAdUnitID:(NSString *)interstitialAdUnitID {
    [self setUserDefaultsValue:interstitialAdUnitID forKey:kUSCurrentInterstitialAdUnitIdKey];
}


+ (NSString*)videoAdUnitID {
    return [self getUserDefaultsValueForKey:kUSCurrentVideoAdUnitIdKey] ?:  DefaultAdUnitId.videoAdUnitID;
}

+ (void)setVideoAdUnitID:(NSString *)videoAdUnitID {
    [self setUserDefaultsValue:videoAdUnitID forKey:kUSCurrentVideoAdUnitIdKey];
}


+ (NSString*)nativeAdUnitID {
    return [self getUserDefaultsValueForKey:kUSCurrentNativeAdUnitIdKey] ?:  DefaultAdUnitId.nativeAdUnitID;
}

+ (void)setNativeAdUnitID:(NSString *)nativeAdUnitID {
    [self setUserDefaultsValue:nativeAdUnitID forKey:kUSCurrentNativeAdUnitIdKey];
}

+ (NSString*)nativeAssetsAdUnitID {
    return [self getUserDefaultsValueForKey:kUSCurrentNativeAssetsAdUnitIdKey] ?:  DefaultAdUnitId.nativeAssetsAdUnitID;
}

+ (void)setNativeAssetsAdUnitID:(NSString *)nativeAssetsAdUnitID {
    [self setUserDefaultsValue:nativeAssetsAdUnitID forKey:kUSCurrentNativeAssetsAdUnitIdKey];
}

#pragma mark - Private

+ (id)getUserDefaultsValueForKey:(NSString *)key {
    if (key.length > 0) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    return nil;
}

+ (void)setUserDefaultsValue:(id)vaue forKey:(NSString*)key {
    if (key.length > 0) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:vaue forKey:key];
        [userDefault synchronize];
    }
}

@end
