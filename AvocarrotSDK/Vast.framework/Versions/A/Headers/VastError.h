//
//  AVOVASTError.h
//  Vast
//
//  Created by Glispa GmbH on 22/07/16.
//  Copyright © 2016 Glispa Gmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kAVOVASTErrorDomain;

typedef enum : NSUInteger {
    AVOVASTErrorMaximumWrapperDepth = 1200,
    AVOVASTErrorXMLParseFailure,
    AVOVASTErrorNoAdsFound,
    AVOVASTErrorNetworkError,
    AVOVASTErrorResourceDownlodingCancel,
    AVOVASTErrorServerFail
} VastErrorCode;

@interface AVOVASTError : NSError

@property(nonatomic, readonly) NSString *avo_errorDescription;

+ (id)errorWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *)localizedDescription;

@end

