//
//  AvocarrotSDK.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 06/08/15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AVOUserGenderMale,
    AVOUserGenderFemale,
    AVOUserGenderOther
} AVOUserGender;


@interface AvocarrotSDK : NSObject

/**
 * Provides access to the AvocarrotSDK shared object.
 *
 * @return a singleton AvocarrotSDK instance.
 */
@property(class, nonatomic, strong, readonly, nonnull) AvocarrotSDK *sharedSDK;

/**
 * Provides access to the AvocarrotSDK version
 */
@property(class, nonatomic, strong, readonly, nonnull) NSString *sdkVersion;

/**
 * Provides access to the AvocarrotSDK logging permission
 */
@property(class, nonatomic, assign) BOOL logEnabled;

/**
 * Provides access to test modes of server networks and external libs. With test mode enabled networks will return only test ads
 */
@property(class, nonatomic, assign) BOOL testMode;

@end


@interface AvocarrotSDK (AVOUserInfo)

/**
 *  Enables sending statistics from the AvocarrotSDK
 *
 *  @param birthday - the app user birthday
 */
+ (void)setBirthday:(NSDate *_Nonnull)birthday;

/**
 *  Enables sending statistics from the AvocarrotSDK
 *
 *  @param userGender - the app user gender
 */
+ (void)setGender:(AVOUserGender)userGender;

/**
 *  Enables sending statistics from the AvocarrotSDK
 *
 *  @param interests - the app user interests
 */
+ (void)setInterests:(NSArray<NSString *> *_Nonnull)interests;

@end



