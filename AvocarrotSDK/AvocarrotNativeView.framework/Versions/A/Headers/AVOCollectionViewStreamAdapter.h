//
//  AVOCollectionViewStreamAdapter.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AVOStreamAdapter.h"

@class AVOTemplateCustomizationObject;
@protocol AVOCollectionViewStreamAdapterDelegate;


@interface AVOCollectionViewStreamAdapter : AVOStreamAdapter

@property(nonatomic, weak, nullable) id <AVOCollectionViewStreamAdapterDelegate> delegate;

/**
 * There is a bug in UICollectionView, it interchanges the minimumInteritemSpacing and minimumLineSpacing if items have different size. If all items in collection have the same size, do not interchange it by yourself, we will do it automatically for you. If you interchange spacings on your side, set this flag to NO and we won't interchange them
 */
@property(nonatomic, assign) BOOL interchangeLayoutSpacings;


/**
 If flag is true, we shift collection view offset back to the original position after we insert ads, cause it's moved if there ads, that inserted before the current offset. Default value is true.
 */
@property(nonatomic, assign) BOOL shiftOffsetBackOnAdInsert;
@end


@interface AVOCollectionViewStreamAdapter (AVOCollectionViewEditMode)

/**
 *  If you want to insert rows use this method to make the stream adapter work correctly
 *  @param indexPaths               - array of index paths which you would like to insert
 */
- (void)insertItemsAtIndexPaths:(NSArray *_Nullable)indexPaths;

/**
 *  If you want to delete rows use this method to make the stream adapter work correctly
 *  @param indexPaths               - array of index paths which you would like to delete
 */
- (void)deleteItemsAtIndexPaths:(NSArray *_Nullable)indexPaths;


@end


@interface AVOCollectionViewStreamAdapter (CellRendering)

/**
 *  Render the native ad cell at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *  @param adCell                  - cell where ad should be rendered
 *
 *  @return UICollectionViewCell with rendered native ad at index path
 */
- (UICollectionViewCell *_Nonnull)renderedAdCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath inCell:(UICollectionViewCell *_Nonnull)adCell;

@end

@protocol AVOCollectionViewStreamAdapterDelegate <NSObject>


/**
 *  Rendered native ad cell size at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *
 *  @return size of rendered ad cell at index path
 */
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *_Nullable)indexPath;

@end
