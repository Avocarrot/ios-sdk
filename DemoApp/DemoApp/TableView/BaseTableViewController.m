//
//  BaseTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 10.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "BaseTableViewController.h"
#import "StreamAdapterTableViewCell.h"
#import "AppControllerManagement.h"
#import "DataUnitManager.h"
#import "DataUnit.h"

static NSInteger const kSectionsCount = 2;

@interface BaseTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StreamAdapterTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StreamAdapterTableViewCell class])];
    [self loadData];
}


#pragma mark - Data management

- (void)loadData {
    NSArray *units = [DataUnitManager createDataUnitList:20];
    [self organizeData:units bySection:kSectionsCount];
}

- (void)organizeData:(NSArray *)dataArray bySection:(NSInteger)sectionsCount {
    self.dataSource = [NSMutableArray new];
    NSInteger itemsInSection = dataArray.count / sectionsCount;
    NSInteger startPos = 0;
    for (int i = 0; i < sectionsCount; i++) {
        NSArray *groupe = [dataArray subarrayWithRange:NSMakeRange(startPos, MIN(itemsInSection, dataArray.count - startPos))];
        startPos += groupe.count;
        NSMutableArray *itemsGroupe = [NSMutableArray arrayWithArray:groupe];
        [self.dataSource addObject:itemsGroupe];
    }
    
    if (startPos < dataArray.count) {
        NSMutableArray *itemsGroupe = [self.dataSource lastObject];
        [itemsGroupe arrayByAddingObjectsFromArray:[dataArray subarrayWithRange:NSMakeRange(startPos, dataArray.count - startPos)]];
    }
}


#pragma mark - Not related to ads

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StreamAdapterTableViewCell *adCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StreamAdapterTableViewCell class])];

    DataUnit *item = self.dataSource[indexPath.section][indexPath.row];

    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        adCell.tweetImageView.image = nil;
    } else {
        adCell.tweetImageView.image = [UIImage imageNamed:item.photo];
    }

    adCell.tweetTextLabel.text = item.specification;

    [adCell layoutIfNeeded];

    return adCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end


@interface BaseTableViewController (AppManagement) <AppControllerManagement>
@end

@implementation BaseTableViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
}

@end

