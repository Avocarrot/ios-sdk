//
//  AVOStreamAdapter.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AVOTemplateCustomizationObject.h"

@interface AVOStreamAdapter : NSObject

@property(nonatomic, weak, nullable, readonly) UIViewController *parentViewController;


/**
 *  Total number of rows in section including ads
 *  @param section                  - section index
 *  @param count                    - number of datasource items in section
 *
 *  @return number of all rows in section, including both datasource rows and ad rows
 */
- (NSInteger)totalNumberOfRowsInSection:(NSInteger)section withDataSourceCount:(NSInteger)count;

/**
 *  Converts index path from view to original data source
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return original index path without ad cells
 */
- (NSIndexPath *_Nullable)originalIndexPath:(NSIndexPath *_Nonnull)indexPath;

/**
 *  Converts dataSource index paths to view's index paths
 *  @param indexPaths                - array of index paths which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return actual indexPath in UITableView or UICollectionView considering added Ads
 */
- (NSMutableArray *_Nonnull)streamIndexPathsFromDataSourceIndexPaths:(NSArray *_Nullable)indexPaths;

/**
 *  Converts original index path to view's index path
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return actual indexPath in UITableView or UICollectionView considering added Ads
 */
- (NSIndexPath *_Nonnull)streamIndexPathFromDataSourceIndexPath:(NSIndexPath *_Nonnull)indexPath;

/**
 *  Should display ad at this index path
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return should display ad at this index path
 */
- (BOOL)shouldDisplayAdAtIndexPath:(NSIndexPath *_Nonnull)indexPath;

/**
 *  Return native ad object for index path if it has to be shown
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return native ad object for index path if it has to be shown
 */
- (id _Nullable)adObjectToDisplayAtIndexPath:(NSIndexPath *_Nonnull)indexPath;

/**
 *  If you want to move sections use this methods for correct working stream adapter
 *  @param section                  - old section number
 *  @param newSection               - new section number
 */
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

@end


@interface AVOStreamAdapter (EventRegistration)

/*
 Duplicate kAVONotification_StreamAdapterAdsDidLoad notification
 */
- (instancetype _Nonnull)onAdsDidLoad:(nullable void (^)(void))block;

/*
 Duplicate kAVONotification_StreamAdapterAdsFailed notification
 */
- (instancetype _Nonnull)onAdsFailed:(nullable void (^)(void))block;

@end

//STREAM ADAPTER
/*
 Called after ads for stream adapter have been loaded. After this event you can either reload your UITableView/UICollectionView or wait - ads will be added automatically during scrolling.
 */
extern NSString *_Nonnull const kAVONotification_StreamAdapterAdsDidLoad;
/*
 Called after ads for stream adapter failed to loaded.
 */
extern NSString *_Nonnull const kAVONotification_StreamAdapterAdsFailed;



