//
//  CustomTemplateFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "CustomTemplateFlowLayoutCollectionViewController.h"
#import "NativeBannerView.h"

@interface CustomTemplateFlowLayoutCollectionViewController() <AVOCollectionViewStreamAdapterDelegate>
@end



@implementation CustomTemplateFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                            parentViewController:self
                                                        adUnitId:self.adUnitId
                                                        delegate:self
                                         adViewClassForRendering:[NativeBannerView class]
                                                         success:^(AVOCollectionViewStreamAdapter * _Nonnull streamAdapter) {
                                                        }
                                                         failure:^(AVOError * _Nonnull error) {
                                                             NSLog(@"Stream adapter creating error %@", error);
                                                         }];
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// Avocarrot SDK knows nothing about optimal size for your native ad view, so you should return desired value.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake( self.collectionView.frame.size.width - 2, [NativeBannerView desiredHeight]);
}


@end
