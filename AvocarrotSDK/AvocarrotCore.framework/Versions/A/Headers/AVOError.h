//
//  AVOError.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 08.04.15.
//  Copyright (c) 2015 Glispa GmbH All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *_Nonnull const kAVOErrorDomain;

typedef enum : NSUInteger {
    AVOErrorInvalidHTTPStatusCode = 900,
    AVOErrorCodeNoAd,
    AVOErrorCodeLoadingProblem,
    AVOErrorCodeUnknownError,
    AVOErrorCodeDND,
    AVOErrorResponseStatus,
    AVOErrorInvalidHandshake,
    AVOErrorTooFrequentAttempts,
    AVOErrorInvalidAdUnitID,
    AVOErrorInvalidParameters,
    AVOErrorTooManyRequests
} AVOErrorCode;

@interface AVOError : NSError

@property(nonatomic, readonly, nonnull) NSString *avo_errorDescription;

+ (nonnull id)errorWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *_Nonnull)localizedDescription;

+ (nonnull id)errorWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *_Nonnull)localizedDescription userInfo:(NSDictionary *_Nullable)userInfo;

- (nonnull id)initWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *_Nonnull)localizedDescription;

- (nonnull id)initWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *_Nonnull)localizedDescription userInfo:(NSDictionary *_Nullable)userInfo;

+ (nonnull instancetype)avo_invalidHTTPStatusError;

+ (nonnull instancetype)avo_noAdError;

+ (nonnull instancetype)avo_adLoadingError;

+ (nonnull instancetype)avo_unknownError;

+ (nonnull instancetype)avo_dndError;

+ (nonnull instancetype)avo_responseStatusError;

+ (nonnull instancetype)avo_InvalidHandshakeError;

+ (nonnull instancetype)avo_tooFrequentAttempts;

+ (nonnull instancetype)avo_invalidAdUnitID;

+ (nonnull instancetype)avo_invalidParameters;

+ (nonnull instancetype)avo_tooManyRequests;

@end
