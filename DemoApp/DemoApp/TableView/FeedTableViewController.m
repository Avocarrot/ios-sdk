//  FeedTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "FeedTableViewController.h"

@interface FeedTableViewController () <AVOTableViewStreamAdapterDelegate>
@property (assign) NSUInteger adCellHeight;
@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // If adCellHeight = 0, ad cell height will be calculated on the base of predefined size,
    // otherwise you can set desired height value
    self.adCellHeight = 0; //320
    [self loadAds];
}

- (void)loadAds {
    id <AVOTableViewStreamAdapterDelegate> sizeDelegate = nil;
    
    if (self.adCellHeight > 0) {
        sizeDelegate = self;
    }
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                       parentViewController:self
                                                   adUnitId:self.adUnitId
                                               templateType:AVONativeAdsTemplateTypeFeed
                                                   delegate:sizeDelegate
                                      templateCustomization:^(AVOTemplateCustomizationObject * _Nonnull templateCustomizationObject) {
                                                        //example of editing ad representation via customizationObject
                                                        templateCustomizationObject.avoCTABorderWidth = 1;
                                                        templateCustomizationObject.avoCTACornerRadius = 5;
                                                    }
                                                    success:nil
                                                    failure:^(AVOError * _Nonnull error) {
                                                        NSLog(@"Stream adapter creating error %@", error);
                                                    }];

}

#pragma mark - <AVOTableViewStreamAdapterDelegate> protocol

- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *_Nullable)indexPath {
    return CGSizeMake(self.tableView.frame.size.width, self.adCellHeight);
}

@end
