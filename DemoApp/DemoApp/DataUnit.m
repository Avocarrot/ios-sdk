//
//  DataUnit.m
//  DemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "DataUnit.h"

@interface DataUnit ()
@property(strong, nonatomic) NSString *photo;
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *specification;
@end

@implementation DataUnit
@synthesize photo = _photo;
@synthesize name = _name;
@synthesize specification = _specification;

- (instancetype)initDataUnitWithName:(NSString *)name andSpecification:(NSString *)specification andPhoto:(NSString *)photo {
    if (self = [super init]) {
        self.name = name;
        self.specification = specification;
        self.photo = photo;
    }
    return self;
}

@end
