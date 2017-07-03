//
//  MasterTableViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 03/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterTableItem;

@interface MasterTableViewController : UITableViewController

@property(nonatomic, strong) NSArray <MasterTableItem *> *adItems;

- (void)update;
@end
