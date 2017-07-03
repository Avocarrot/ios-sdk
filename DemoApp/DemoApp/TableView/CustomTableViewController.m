//  CustomTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "CustomTableViewController.h"
#import "NativeBannerView.h"

@interface CustomTableViewController ()
@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [self loadAds];
}

- (void)loadAds {
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                   parentViewController:self
                                                               adUnitId:self.adUnitId
                                                adViewClassForRendering:[NativeBannerView class]];
}
@end
