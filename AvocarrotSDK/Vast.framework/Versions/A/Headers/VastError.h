//
//  AVOVASTError.h
//  Vast
//
//  Created by Glispa GmbH on 22/07/16.
//  Copyright © 2016 Glispa Gmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kAVOVASTErrorDomain;

typedef NS_ENUM(NSUInteger, VastErrorCode) {
    AVOVASTSpecsCode_XMLParsingError = 100,
    AVOVASTSpecsCode_VASTSchemaValidationError = 101,
    AVOVASTSpecsCode_VASTVersionOfResponseNotSupported = 102,
    AVOVASTSpecsCode_TraffickingErrorPlayerCannotDisplayAd = 200,
    AVOVASTSpecsCode_PlayerExpectDifferentLinearity = 201,
    AVOVASTSpecsCode_PlayerExpectDifferentDuration = 202,
    AVOVASTSpecsCode_PlayerExpectingDifferentSize = 203,
    AVOVASTSpecsCode_GeneralWrapperError = 300,
    AVOVASTSpecsCode_TimeoutOfURIInWrapper = 301,
    AVOVASTSpecsCode_TooManyWrapperWithoutInLine = 302,
    AVOVASTSpecsCode_NoVASTOneOrMoreWrappers = 303,
    AVOVASTSpecsCode_GeneralLinearErrorPlayerCannnotDisplayLinearAd = 400,
    AVOVASTSpecsCode_FileNotFoundLinearFromURI = 401,
    AVOVASTSpecsCode_TimeoutOfMediaFileURI = 402,
    AVOVASTSpecsCode_CouldnotFindMediaFileThatIsSupportedByPlayer = 403,
    AVOVASTSpecsCode_PlayerFoundSupportedMediaFileButCouldnotDisplay = 405,
    AVOVASTSpecsCode_GeneralNonLinearAdError = 500,
    AVOVASTSpecsCode_UnableDisplayNonLinearCreativeDimensionsDoNotAlign = 501,
    AVOVASTSpecsCode_UnableFetchNonLinearResource = 502,
    AVOVASTSpecsCode_CouldNotFindNonLinearResourceWithSupportedType = 503,
    AVOVASTSpecsCode_GeneralCompanionAdsError = 600,
    AVOVASTSpecsCode_UnableDisplayCompanionCreativeDimensionsDoNotAlign = 601,
    AVOVASTSpecsCode_UnableDisplayRequiredCompanion = 602,
    AVOVASTSpecsCode_UnableFetchCompanionResource = 603,
    AVOVASTSpecsCode_CouldNotFindCompanionResourceWithSupportedType = 604,
    AVOVASTSpecsCode_UndefinedError = 900,
    AVOVASTSpecsCode_GeneralVPAIDError = 901,
    
    AVOVAST_Only_Internal_Codes = 1200
};

@interface AVOVASTError : NSError

@property(nonatomic, readonly) NSString *avo_errorDescription;

+ (id)vasterrorWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *)localizedDescription;
+ (id)vasterrorWithCode:(NSInteger)errorCode;

@end

