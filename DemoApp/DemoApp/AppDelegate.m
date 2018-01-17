//
//  AppDelegate.m
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 27/07/15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AvocarrotSDK setTestMode:YES];
    return YES;
}

@end
