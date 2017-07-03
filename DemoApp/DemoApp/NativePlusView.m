//
//  NativePlusView.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/10/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "NativePlusView.h"


@implementation NativePlusView

+ (CGFloat)desiredHeight {
    return 300;
}


#pragma mark - Overriden methods


// Implement + (NSString*)xibName only if this class is related with XIB
+ (NSString *)xibName {
    return NSStringFromClass([self class]);
}


@end
