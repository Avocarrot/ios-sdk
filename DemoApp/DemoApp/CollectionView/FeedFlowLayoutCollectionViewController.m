//
//  FeedFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "FeedFlowLayoutCollectionViewController.h"

@interface FeedFlowLayoutCollectionViewController () <AVOCollectionViewStreamAdapterDelegate>
@property(strong, nonatomic) AVOCollectionViewStreamAdapter *adapter;
@end


@implementation FeedFlowLayoutCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {

    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:self.adUnitId
                                                                templateType:AVONativeAdsTemplateTypeFeed
                                                                    delegate:self  // or "delegate:nil" if you would like to use our predefined ad cell height of AVONativeAdsTemplateTypeFeed ad template
                                                       templateCustomization:nil];
    self.adapter.shiftOffsetBackOnAdInsert = NO;
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width - 2, 320);
}

@end
