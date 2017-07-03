//
//  GridIconFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 23.05.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "GridIconFlowLayoutCollectionViewController.h"

@interface GridIconFlowLayoutCollectionViewController ()<AVOCollectionViewStreamAdapterDelegate>
@property(strong, nonatomic) AVOCollectionViewStreamAdapter *adapter;
@end

@implementation GridIconFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {

    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:self.adUnitId
                                                                templateType:AVONativeAdsTemplateTypeGridIcon
                                                                    delegate:self // or "delegate:nil" if you would like to use our predefined ad cell height of AVONativeAdsTemplateTypeList template
                                                       templateCustomization:nil];
    self.adapter.shiftOffsetBackOnAdInsert = NO;
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((int)((self.collectionView.frame.size.width - 4) / 2.0), (int)((self.collectionView.frame.size.width - 4) / 2.0));
}

@end
