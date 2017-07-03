//
//  BaseTableViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController
@property (copy, nonatomic) NSString *adUnitId;
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) AVOTableViewStreamAdapter *adapter;
@end
