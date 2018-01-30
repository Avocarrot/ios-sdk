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
    AVOErrorTooManyRequests,
    AVOErrorMraidError,
    AVOErrorPreviousAdRequestInProgress,
    AVOErrorFeatureDisabled,
    AVOErrorTTLExpired
} AVOErrorCode;

@interface AVOError : NSError

@property(nonatomic, readonly, nonnull) NSString *avo_errorDescription;

@end
