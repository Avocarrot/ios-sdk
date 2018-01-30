//
//  GridFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 23.05.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "GridFlowLayoutCollectionViewController.h"

@interface GridFlowLayoutCollectionViewController() <AVOCollectionViewStreamAdapterDelegate>
@end

@implementation GridFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAds];
}

- (void)loadAds {
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                            parentViewController:self
                                                        adUnitId:self.adUnitId
                                                    templateType:AVONativeAdsTemplateTypeGrid
                                                        delegate:self
                                           templateCustomization:nil
                                                         success:^(AVOCollectionViewStreamAdapter * _Nonnull streamAdapter) {
                                                             streamAdapter.shiftOffsetBackOnAdInsert = NO;
                                                         }
                                                         failure:^(AVOError * _Nonnull error) {
                                                             NSLog(@"Stream adapter creating error %@", error);
                                                         }];
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((int)((self.collectionView.frame.size.width - 4) / 2.0), (int)((self.collectionView.frame.size.width - 4) / 2.0));
}

@end
