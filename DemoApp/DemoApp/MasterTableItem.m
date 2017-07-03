//
//  MasterTableItem.m
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "MasterTableItem.h"

@implementation MasterTableItem

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems withUserData:(NSDictionary <NSString *, NSObject *>*)userData withImageName:(NSString*)image {
    self = [super init];
    if (self) {
        self.title = title;
        self.controller = controller;
        self.xibName = xibName;
        self.childItems = childItems;
        self.userData = userData;
        self.image = image;
    }
    return self;
}

- (id)initWithTitle:(NSString*)title withChilds:(NSArray <MasterTableItem *>*)childItems withImageName:(NSString*)image {
    return [self initWithTitle:title withController:nil withXibName:nil withChilds:childItems withUserData:nil withImageName:image];
}

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems {
    return [self initWithTitle:title withController:controller withXibName:xibName withChilds:childItems withUserData:nil withImageName:nil];
}

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems withUserData:(NSDictionary <NSString *, NSObject *>*)userData {
    return [self initWithTitle:title withController:controller withXibName:xibName withChilds:childItems withUserData:userData withImageName:nil];
}

@end


