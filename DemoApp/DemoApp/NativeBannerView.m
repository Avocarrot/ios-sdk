//
//  NativeBannerView.m
//  DemoApp
//
//  Created by Glispa GmbH on 12/29/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "NativeBannerView.h"


@implementation NativeBannerView

+ (CGFloat)desiredHeight {
    return 60;
}


#pragma mark - Overriden methods


// Implement + (NSString*)xibName only if this class is related with XIB
+ (NSString *)xibName {
    return NSStringFromClass([self class]);
}


@end
