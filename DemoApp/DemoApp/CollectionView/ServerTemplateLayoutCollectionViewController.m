//
//  ServerTemplateLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "ServerTemplateLayoutCollectionViewController.h"

@interface ServerTemplateLayoutCollectionViewController () <AVOCollectionViewStreamAdapterDelegate>
@property(strong, nonatomic) AVOCollectionViewStreamAdapter *adapter;
@end

@implementation ServerTemplateLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                                           parentViewController:self
                                                                       adUnitId:self.adUnitId
                                                                   templateType:AVONativeAdsTemplateTypeServer
                                                                       delegate:self
                                                          templateCustomization:nil];
    self.adapter.shiftOffsetBackOnAdInsert = NO;
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// Avocarrot SDK knows nothing about optimal size for server template, so you should return desired value.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width - 2, 300);
}

@end
