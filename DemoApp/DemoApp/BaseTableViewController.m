//
//  BaseTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "BaseTableViewController.h"
#import "StreamAdapterTableViewCell.h"
#import "AppControllerManagement.h"

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StreamAdapterTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StreamAdapterTableViewCell class])];
}

@end


@interface BaseTableViewController (AppManagement) <AppControllerManagement>
@end

@implementation BaseTableViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
}

@end

