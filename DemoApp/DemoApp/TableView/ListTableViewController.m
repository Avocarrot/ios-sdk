//  ListTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController () <AVOTableViewStreamAdapterDelegate>
@property (assign) NSUInteger adCellHeight;
@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // If adCellHeight = 0, ad cell height will be calculated on the base of predefined size,
    // otherwise you can set desired height value
    self.adCellHeight = 0; //105
    [self loadAds];
}

- (void)loadAds {
    id <AVOTableViewStreamAdapterDelegate> sizeDelegate = nil;
    
    if (self.adCellHeight > 0) {
        sizeDelegate = self;
    }
    
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                                   parentViewController:self
                                                               adUnitId:self.adUnitId
                                                           templateType:AVONativeAdsTemplateTypeList
                                                               delegate:sizeDelegate
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
