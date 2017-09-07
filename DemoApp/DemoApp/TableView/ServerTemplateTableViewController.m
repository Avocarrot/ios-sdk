//
//  ServerTemplateTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "ServerTemplateTableViewController.h"

@implementation ServerTemplateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                      parentViewController:self
                                                                  adUnitId:self.adUnitId
                                                              templateType:AVONativeAdsTemplateTypeServer
                                                     templateCustomization:^(AVOTemplateCustomizationObject *templateCustomizationObject) {
                                                         //example of editing ad representation via customizationObject
                                                         templateCustomizationObject.avoCTABorderWidth = 1;
                                                         templateCustomizationObject.avoCTACornerRadius = 5;
                                                     }];
}

@end
