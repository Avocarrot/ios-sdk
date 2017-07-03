//
//  AVOTableViewStreamAdapter.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AVOStreamAdapter.h"

@class AVOTemplateCustomizationObject;

@interface AVOTableViewStreamAdapter : AVOStreamAdapter

@end

@interface AVOTableViewStreamAdapter (AVOTableViewEditMode)

/**
 *  If you want to insert rows use this methods to make the stream adapter work correctly
 *  @param indexPaths               - array of index paths which you would like to insert
 *  @param animation                - UITableView row animation enum
 */
- (void)insertRowsAtIndexPaths:(NSArray *_Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  If you want to delete rows use wthis methods to make the stream adapter work correctly
 *  @param indexPaths               - array of index paths which you would like to delete
 *  @param animation                - UITableView row animation enum
 */
- (void)deleteRowsAtIndexPaths:(NSArray *_Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

@end


