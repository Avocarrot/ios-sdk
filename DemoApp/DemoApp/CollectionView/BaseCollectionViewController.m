//
//  BaseCollectionViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 11.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "AppControllerManagement.h"

@implementation BaseCollectionViewController

@end


@interface BaseCollectionViewController (AppManagement) <AppControllerManagement>
@end

@implementation BaseCollectionViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
}

@end
