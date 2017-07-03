//
//  CreateAdUnitIdViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AdType) {
    AdBanner = 0,
    AdInterstitial,
    AdVideo,
    AdNative,
    AdUnknown,
};

@interface AdUnitId : NSObject <NSCoding>

@property (copy, nonatomic) NSString *adUnitId;
@property (assign, nonatomic) AdType adType;

+ (instancetype)unitIdWith:(NSString*)adUnitId withAdType:(AdType)adType;
@end


@interface CreateAdUnitIdViewController : UIViewController

@property (strong, nonatomic) UIImage *backgroundImage;
@property (copy, nonatomic) void (^backBlock) (NSString*, AdType);
@end
