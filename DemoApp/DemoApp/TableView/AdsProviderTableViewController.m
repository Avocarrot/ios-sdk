//
//  AdsProviderTableViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 12.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AdsProviderTableViewController.h"
#import "StreamAdapterTableViewCell.h"
#import "DataUnitManager.h"
#import "DataUnit.h"

@interface AdsProviderTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) AVONativeAdsProvider *adsProvider;
@property(nonatomic, strong) NSMutableDictionary <NSNumber *, UIView *> *adsArray;
@end

@implementation AdsProviderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
    [self loadAds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return !self.adsArray ? [self.dataSource[section] count] : [self.dataSource[section] count] + 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (self.adsArray) {
        if (indexPath.row == 0) {
            cell = [self getAdsCellForIndexPath:indexPath];
        } else {
            NSIndexPath *originalIndexPath = [NSIndexPath indexPathForRow:(indexPath.row - 1) inSection:indexPath.section];
            cell = [self getDataCellForIndexPath:originalIndexPath];
        }
    } else {
        cell = [self getDataCellForIndexPath:indexPath];
    }
    
    [cell layoutIfNeeded];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
}

- (UITableViewCell *)getAdsCellForIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"AdsTableViewCell"];
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *adView = self.adsArray[@(indexPath.section)];
    if (!adView) {
        adView = [self.adsProvider getNextAdView];
        self.adsArray[@(indexPath.section)] = adView;
    }
    
    if (adView) {
        [cell.contentView addSubview:adView];
        NSDictionary *views = NSDictionaryOfVariableBindings(adView);
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[adView]|" options:0 metrics:nil views:views]];
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[adView]|" options:0 metrics:nil views:views]];
    }
    
    return cell;
}

- (UITableViewCell *)getDataCellForIndexPath:(NSIndexPath *)indexPath {
    StreamAdapterTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StreamAdapterTableViewCell class])];
    
    DataUnit *item = self.dataSource[indexPath.section][indexPath.row];
    
    cell.tweetNameLabel.text = item.name;
    if (!item.photo) {
       cell.tweetImageView.image = nil;
    } else {
        cell.tweetImageView.image = [UIImage imageNamed:item.photo];
    }
    
    cell.tweetTextLabel.text = item.specification;
    
    return cell;
}

#pragma mark - Ads
- (void)loadAds {
    self.adsProvider = [AvocarrotSDK.sharedSDK createNativeAdsProviderForAdunit:self.adUnitId
                                                                   templateType:AVONativeAdsTemplateTypeList
                                                          templateCustomization:^(AVOTemplateCustomizationObject *templateCustomizationObject){
                                                                templateCustomizationObject.avoCTABorderWidth = 1;
                                                                templateCustomizationObject.avoCTACornerRadius = 5;
                                                          }];
    
    __weak typeof(self) weakSelf = self;
    [self.adsProvider preloadAdsInCache:3
                   parentViewController:self
                                didLoad:^(NSUInteger preloadCount){
                                    __strong __typeof__(self) sSelf = weakSelf;
                                    sSelf.adsArray = [NSMutableDictionary new];
                                    [sSelf.tableView reloadData];
                                }
                                didFail:^(AVOError *error){
                                    NSLog(@"Native Ads Provider error: %@", error);
                                }];
}

#pragma mark - Private

- (void)setupUI {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.estimatedRowHeight = 140.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AdsTableViewCell"];
}

#pragma mark - Data management

- (void)loadData {
    self.dataSource = [DataUnitManager createDataUnitList:100 dividedByGroups:10];
}

@end
