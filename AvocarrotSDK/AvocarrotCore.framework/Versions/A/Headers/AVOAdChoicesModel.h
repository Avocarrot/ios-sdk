//
//  AVOAdChoicesModel.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 29.05.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVOAdChoicesModel : NSObject
@property(nonatomic, strong, nullable) NSString *iconUrl;
@property(nonatomic, strong, nullable) NSString *iconCaption;
@property(nonatomic, strong, nullable) NSString *clickUrl;

- (id _Nonnull)initWithDictionaryData:(NSDictionary *_Nonnull)data;

@end
