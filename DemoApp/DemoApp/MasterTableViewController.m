//
//  AVOMasterTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 03/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "MasterTableViewController.h"
#import "MasterTableItem.h"
#import "AppControllerManagement.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Public

- (void)update{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    MasterTableItem *item = self.adItems[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.text = item.title;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MasterTableItem *item = self.adItems[indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController;
    if (item.controller && item.xibName) {
        Class class = NSClassFromString(item.controller);
        viewController = [[class alloc] initWithNibName:item.xibName bundle:[NSBundle mainBundle]];
        [self.navigationController showViewController:viewController sender:nil];
    } else if (item.controller) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:item.controller];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if (item.childItems.count > 0) {
        MasterTableViewController *tableController = (MasterTableViewController*)[storyboard instantiateViewControllerWithIdentifier:@"MasterTableViewController"];
        tableController.adItems = item.childItems;
        tableController.title = item.title;
        [self.navigationController pushViewController:tableController animated:YES];
        viewController = tableController;
    }
    
    if ([viewController conformsToProtocol:@protocol(AppControllerManagement)] &&
        [viewController respondsToSelector:@selector(applyUserData:)]) {
        [(UIViewController<AppControllerManagement> *)viewController applyUserData:item.userData];
    }
}

@end
