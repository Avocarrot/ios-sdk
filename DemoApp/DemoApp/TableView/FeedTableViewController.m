//  FeedTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "FeedTableViewController.h"

@interface FeedTableViewController ()
@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {

    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                   parentViewController:self
                                                               adUnitId:self.adUnitId
                                                           templateType:AVONativeAdsTemplateTypeFeed
                                                  templateCustomization:^(AVOTemplateCustomizationObject *templateCustomizationObject) {
                                                      //example of editing ad representation via customizationObject
                                                      templateCustomizationObject.avoCTABorderWidth = 1;
                                                      templateCustomizationObject.avoCTACornerRadius = 5;
                                                  }];
}
@end
