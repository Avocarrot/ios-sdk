//
//  MasterTableItem.h
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MasterTableItem : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *controller;
@property (copy, nonatomic) NSString *xibName;
@property (copy, nonatomic) NSArray <MasterTableItem *> *childItems;
@property (copy, nonatomic) NSDictionary <NSString *, NSObject *> *userData;
@property (copy, nonatomic) NSString *image;

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems withUserData:(NSDictionary <NSString *, NSObject *>*)userData withImageName:(NSString*)image;

- (id)initWithTitle:(NSString*)title withChilds:(NSArray <MasterTableItem *>*)childItems withImageName:(NSString*)image;

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems;

- (id)initWithTitle:(NSString*)title withController:(NSString*)controller withXibName:(NSString*)xibName withChilds:(NSArray <MasterTableItem *>*)childItems withUserData:(NSDictionary <NSString *, NSObject *>*)userData;

@end
