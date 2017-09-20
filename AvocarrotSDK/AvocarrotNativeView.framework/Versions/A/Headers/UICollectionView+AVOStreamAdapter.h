//
//  UICollectionView+AVOLocationControl.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04.08.16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVOCollectionViewStreamAdapter;

@interface UICollectionView (AVOStreamAdapter)

@property(nonatomic, strong, readonly) AVOCollectionViewStreamAdapter *streamAdapter;

- (void)avo_reloadData;

- (id)avo_dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (NSArray *)avo_indexPathsForSelectedItems;

- (void)avo_selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition;

- (void)avo_deselectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

- (UICollectionViewLayoutAttributes *)avo_layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)avo_indexPathForItemAtPoint:(CGPoint)point;

- (NSIndexPath *)avo_indexPathForCell:(UICollectionViewCell *)cell;

- (NSArray *)avo_indexPathsForVisibleItems;

- (void)avo_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)avo_insertSections:(NSIndexSet *)sections;

- (void)avo_deleteSections:(NSIndexSet *)sections;

- (void)avo_moveSection:(NSInteger)section toSection:(NSInteger)newSection;

- (void)avo_insertItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)avo_deleteItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)avo_reloadItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)avo_moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

- (void)avo_performBatchUpdates:(void (^)(void))updates completion:(void (^)(BOOL finished))completion;
@end
