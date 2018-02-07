//
//  ServerTemplateLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "ServerTemplateLayoutCollectionViewController.h"

@interface ServerTemplateLayoutCollectionViewController() <AVOCollectionViewStreamAdapterDelegate>
@property (assign) NSUInteger adCellHeight;
@end

@implementation ServerTemplateLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // You should set value of ad cell height for server template. Just try different values.
    self.adCellHeight = 320;
    [self loadAds];
}

- (void)loadAds {
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                            parentViewController:self
                                                        adUnitId:self.adUnitId
                                                    templateType:AVONativeAdsTemplateTypeServer
                                                        delegate:self
                                           templateCustomization:nil
                                                         success:^(AVOCollectionViewStreamAdapter * _Nonnull streamAdapter) {
                                                         }
                                                         failure:^(AVOError * _Nonnull error) {
                                                             NSLog(@"Stream adapter creating error %@", error);
                                                         }];
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// Avocarrot SDK knows nothing about optimal size for server template, so you should return desired value.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width - 2, self.adCellHeight);
}

@end
