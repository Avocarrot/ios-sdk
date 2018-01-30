//
//  Constants.m
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "Constants.h"

@implementation AppConstants

+ (UIColor*)mainColor {
    return [UIColor colorWithRed:78/255.0 green:146/255.0 blue:222/255.0 alpha:1.0];
}

@end

@implementation DefaultAdUnitId

+ (NSString *)bannerAdUnitID {
    return @"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69";
}

+ (NSString *)interstitialAdUnitID {
    return @"2cb34a73-0012-4264-9526-bde1fce2ba92";
}

+ (NSString *)videoAdUnitID {
    return @"87f65c4c-f12d-4bb6-96fd-063fe30c4d69";
}

+ (NSString *)nativeAdUnitID {
    return @"7f900c7d-7ce3-4190-8e93-310053e70ca2";
}

+ (NSString *)nativeAssetsAdUnitID {
    return @"67ac0b81-4ca0-4808-aa09-66bb0b60a2da";
}

@end

