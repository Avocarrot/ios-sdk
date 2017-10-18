//
//  ServerTemplateTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "ServerTemplateTableViewController.h"

@interface ServerTemplateTableViewController() <AVOTableViewStreamAdapterDelegate>
@property (assign) NSUInteger adCellHeight;
@end

@implementation ServerTemplateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // You should set value of ad cell height for server template. Just try different values.
    self.adCellHeight = 320;
    [self loadAds];
}

- (void)loadAds {
    
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                      parentViewController:self
                                                                  adUnitId:self.adUnitId
                                                              templateType:AVONativeAdsTemplateTypeServer
                                                                  delegate:self
                                                     templateCustomization:^(AVOTemplateCustomizationObject *templateCustomizationObject) {
                                                         //example of editing ad representation via customizationObject
                                                         templateCustomizationObject.avoCTABorderWidth = 1;
                                                         templateCustomizationObject.avoCTACornerRadius = 5;
                                                     }];
}

#pragma mark - <AVOTableViewStreamAdapterDelegate> protocol

- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *_Nullable)indexPath {
    return CGSizeMake(self.tableView.frame.size.width, self.adCellHeight);
}

@end
