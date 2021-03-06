//
//  ListFlowLayoutCollectionViewController.m
//  DemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "ListFlowLayoutCollectionViewController.h"

@interface ListFlowLayoutCollectionViewController() <AVOCollectionViewStreamAdapterDelegate>
@property (assign) NSUInteger adCellHeight;
@end


@implementation ListFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // If adCellHeight = 0, ad cell height will be calculated on the base of predefined size,
    // otherwise you can set desired height value
    self.adCellHeight = 105;
    [self loadAds];
}

- (void)loadAds {
    id <AVOCollectionViewStreamAdapterDelegate> sizeDelegate = nil;
    
    // if you would like to use our predefined ad cell height of AVONativeAdsTemplateTypeList template
    if (self.adCellHeight > 0) {
        sizeDelegate = self;
    }
    
    [AvocarrotSDK.sharedSDK createStreamAdapterForCollectionView:self.collectionView
                                            parentViewController:self
                                                        adUnitId:self.adUnitId
                                                    templateType:AVONativeAdsTemplateTypeList
                                                        delegate:sizeDelegate
                                           templateCustomization:nil
                                                         success:^(AVOCollectionViewStreamAdapter * _Nonnull streamAdapter) {
                                                         }
                                                         failure:^(AVOError * _Nonnull error) {
                                                             NSLog(@"Stream adapter creating error %@", error);
                                                         }];
}

#pragma mark - AVOCollectionViewStreamAdapterDelegate

// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width - 2, self.adCellHeight);
}

@end
