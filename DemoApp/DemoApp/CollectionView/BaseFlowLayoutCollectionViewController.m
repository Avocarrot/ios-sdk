//
//  BaseFlowLayoutCollectionViewController.h
//  DemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "BaseFlowLayoutCollectionViewController.h"
#import "StreamAdapterCollectionViewCell.h"
#import "DataUnitManager.h"
#import "DataUnit.h"


@interface BaseFlowLayoutCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end


@implementation BaseFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.dataSource = [NSMutableArray new];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([StreamAdapterCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([StreamAdapterCollectionViewCell class])];
    [self loadData];
}


#pragma  mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    StreamAdapterCollectionViewCell *adCell = [collectionView avo_dequeueReusableCellWithReuseIdentifier:NSStringFromClass([StreamAdapterCollectionViewCell class]) forIndexPath:indexPath];
    DataUnit *item = self.dataSource[indexPath.row];

    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        [adCell.tweetImageHeightConstraint setConstant:0];
        adCell.tweetImageView.image = nil;
    } else {
        [adCell.tweetImageHeightConstraint setConstant:(self.collectionView.frame.size.width - 4) / 2];
        adCell.tweetImageView.image = [UIImage imageNamed:item.photo];
    }
    adCell.tweetTextLabel.text = item.specification;

    [adCell layoutIfNeeded];
    return adCell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((NSInteger) ((self.collectionView.frame.size.width - 4) / 2), (NSInteger) ((self.collectionView.frame.size.width - 4) / 1.1f));
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


#pragma mark - Data

- (void)loadData {
    self.dataSource = [DataUnitManager createDataUnitList:20];
}

@end
