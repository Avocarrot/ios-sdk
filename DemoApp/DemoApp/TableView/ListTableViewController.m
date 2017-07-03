//  ListTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()
@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {

    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                   parentViewController:self
                                                               adUnitId:self.adUnitId
                                                           templateType:AVONativeAdsTemplateTypeList
                                                  templateCustomization:^(AVOTemplateCustomizationObject *templateCustomizationObject) {
                                                      //example of editing ad representation via customizationObject
                                                      templateCustomizationObject.avoCTABorderWidth = 1;
                                                      templateCustomizationObject.avoCTACornerRadius = 5;
                                                  }];
}
@end
