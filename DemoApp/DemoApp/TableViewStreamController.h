//
//  TableViewStreamController.h
//  DemoApp
//
//  Created by Glispa GmbH on 12.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "BaseTableViewController.h"

@interface TableViewStreamController : BaseTableViewController
@property(strong, nonatomic) AVOTableViewStreamAdapter *adapter;
@end
