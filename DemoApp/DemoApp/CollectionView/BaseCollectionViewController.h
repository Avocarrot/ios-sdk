//
//  BaseCollectionViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 11.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewController : UIViewController

@property(weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableArray *dataSource;
@property (copy, nonatomic) NSString *adUnitId;

@end
