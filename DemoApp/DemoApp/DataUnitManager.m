//
//  DataUnitManager.m
//  DemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "DataUnitManager.h"
#import "DataUnit.h"

static NSString *const kAVOUnitDefaultText_1 = @"iMac is a range of all-in-one Macintosh desktop computers designed and built by Apple Inc. It has been the primary part of Apple's consumer desktop offerings since its debut in August 1998, and has evolved through seven distinct forms.";
static NSString *const kAVOUnitDefaultTitle_1 = @"iMac";

static NSString *const kAVOUnitDefaultText_2 = @"iPhone (/ˈaɪfoʊn/ EYE-fohn) is a line of smartphones designed and marketed by Apple Inc. They run Apple's iOS mobile operating system. The first generation iPhone was released on June 29, 2007, and there have been multiple new hardware iterations since.";
static NSString *const kAVOUnitDefaultTitle_2 = @"iPhone";


static NSUInteger DUMImageCount = 10;

@implementation DataUnitManager

+ (nonnull NSArray<DataUnit *> *)createDataUnitList:(NSUInteger)count {
    return [DataUnitManager createDataUnitList:count from:1];
}


+ (nonnull NSArray<DataUnit *> *)createDataUnitList:(NSUInteger)count from:(NSUInteger)from {
    NSMutableArray *units = [NSMutableArray new];
    NSArray *rawData = @[@{@"title": kAVOUnitDefaultTitle_1, @"text": kAVOUnitDefaultText_1,
                           @"template": @"image-imac"},
                         @{@"title": kAVOUnitDefaultTitle_2, @"text": kAVOUnitDefaultText_2,
                           @"template": @"image-iphone"}];

    NSUInteger i = from;
    while (i <= count + from - 1) {
        for (NSDictionary *item in rawData)
            for (NSUInteger imageNum = 1; imageNum <= DUMImageCount; imageNum++) {
                if (i <= count + from - 1) {
                    NSString *title = item[@"title"];
                    NSString *text = item[@"text"];
                    NSString *template = item[@"template"];
                    NSString *name = [NSString stringWithFormat:@"%@ #%lu", title, (unsigned long) i];
                    NSString *photo = [NSString stringWithFormat:@"%@-%lu.png", template, imageNum];
                    DataUnit *unit = [[DataUnit alloc] initDataUnitWithName:name andSpecification:text andPhoto:photo];
                    [units addObject:unit];
                    i++;
                }
        }
    }

    return units;
}

+ (nonnull NSArray<DataUnit *> *)createDataUnitList:(NSUInteger)count dividedByGroups:(NSInteger)groupsCount {
    
    NSArray *units = [self createDataUnitList:count];
    
    NSMutableArray *groups = [NSMutableArray new];
    NSInteger itemsInSection = units.count / groupsCount;
    NSInteger startPos = 0;
    for (int i = 0; i < groupsCount; i++) {
        NSArray *groupe = [units subarrayWithRange:NSMakeRange(startPos, MIN(itemsInSection, units.count - startPos))];
        startPos += groupe.count;
        NSMutableArray *itemsGroup = [NSMutableArray arrayWithArray:groupe];
        [groups addObject:itemsGroup];
    }
    
    if (startPos < units.count) {
        NSMutableArray *itemsGroup = [groups lastObject];
        [itemsGroup arrayByAddingObjectsFromArray:[units subarrayWithRange:NSMakeRange(startPos, units.count - startPos)]];
    }
    
    return groups;
}

@end
