//  CustomTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "CustomTableViewController.h"
#import "NativeBannerView.h"

@interface CustomTableViewController () <AVOTableViewStreamAdapterDelegate>
@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForTableView:self.tableView
                                       parentViewController:self
                                                   adUnitId:self.adUnitId
                                                   delegate:self
                                    adViewClassForRendering:[NativeBannerView class]
                                                    success:nil
                                                    failure:^(AVOError * _Nonnull error) {
                                                        NSLog(@"Streamadapter creating error %@", error);
                                                    }];
}

#pragma mark - <AVOTableViewStreamAdapterDelegate> protocol
// Avocarrot SDK knows nothing about optimal size for your native ad view, so you should return desired value.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *_Nullable)indexPath {
    return CGSizeMake(self.tableView.frame.size.width, [NativeBannerView desiredHeight]);
}

@end
