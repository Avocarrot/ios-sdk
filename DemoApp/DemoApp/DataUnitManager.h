//
//  DataUnitManager.h
//  DemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DataUnit;

@interface DataUnitManager : NSObject

+ (nonnull NSArray<DataUnit *> *)createDataUnitList:(NSUInteger)count;

+ (nonnull NSArray<DataUnit *> *)createDataUnitList:(NSUInteger)count from:(NSUInteger)from;

+ (nonnull NSArray<NSArray<DataUnit*> *> *)createDataUnitList:(NSUInteger)count dividedByGroups:(NSInteger)groupsCount;
@end
