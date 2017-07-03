//
//  NativeStoryView.m
//  DemoApp
//
//  Created by Glispa GmbH on 12/29/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "NativeStoryView.h"

@implementation NativeStoryView


+ (CGFloat)desiredHeight {
    return 160;
}


#pragma mark - Overriden methods


// Implement + (NSString*)xibName only if this class is related with XIB
+ (NSString *)xibName {
    return NSStringFromClass([self class]);
}

@end
