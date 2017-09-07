//
//  TableViewStreamController.m
//  DemoApp
//
//  Created by Glispa GmbH on 12.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "TableViewStreamController.h"
#import "StreamAdapterTableViewCell.h"
#import "DataUnitManager.h"
#import "DataUnit.h"

static NSInteger const kSectionsCount = 2;

@interface TableViewStreamController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *dataSource;
@end

@implementation TableViewStreamController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

#pragma mark - Data management

- (void)loadData {
    self.dataSource = [DataUnitManager createDataUnitList:20 dividedByGroups:kSectionsCount];
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
