//
//  CustomTemplateFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "CustomTemplateFlowLayoutCollectionViewController.h"
#import "NativeBannerView.h"

@interface CustomTemplateFlowLayoutCollectionViewController () <AVOCollectionViewStreamAdapterDelegate>
@property(strong, nonatomic) AVOCollectionViewStreamAdapter *adapter;
@end



@implementation CustomTemplateFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    self.adapter = [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:self.adUnitId
                                                          useDefaultGridMode:YES
                                                                    delegate:self
                                                     adViewClassForRendering:[NativeBannerView class]];
    self.adapter.shiftOffsetBackOnAdInsert = NO;
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake( self.collectionView.frame.size.width - 2, [NativeBannerView desiredHeight]);
}


@end
