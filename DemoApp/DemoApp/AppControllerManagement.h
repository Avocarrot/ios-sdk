//
//  AppControllerManagement.h
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AppControllerManagement <NSObject>
@required
- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData;
@end
