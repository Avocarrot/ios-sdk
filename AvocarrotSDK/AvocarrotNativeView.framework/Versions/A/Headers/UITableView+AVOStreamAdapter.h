//
//  UITableView+AVOLocationControl.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 04.08.16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVOTableViewStreamAdapter;

@interface UITableView (AVOStreamAdapter)

@property(nonatomic, strong, readonly) AVOTableViewStreamAdapter *streamAdapter;

- (void)resetStreamAdapter;

- (void)avo_reloadData;

- (CGRect)avo_rectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)avo_indexPathForRowAtPoint:(CGPoint)point;

- (NSIndexPath *)avo_indexPathForCell:(UITableViewCell *)cell;

- (NSArray *)avo_indexPathsForRowsInRect:(CGRect)rect;

- (NSArray *)avo_indexPathsForVisibleRows;

- (void)avo_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)avo_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)avo_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)avo_moveSection:(NSInteger)section toSection:(NSInteger)newSection;

- (void)avo_insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)avo_deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)avo_reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)avo_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

- (NSIndexPath *)avo_indexPathForSelectedRow;

- (NSArray *)avo_indexPathsForSelectedRows;

- (void)avo_selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

- (void)avo_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

- (id)avo_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)avo_beginUpdates;

- (void)avo_endUpdates;
@end

