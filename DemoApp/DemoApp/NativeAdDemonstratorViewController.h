//
//  NativeAdDemonstratorViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 19.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterTableItem;

@interface NativeAdDemonstratorViewController : UIViewController

@property(copy, nonatomic) NSString *adUnitId;
@property (strong, nonatomic) NSArray <MasterTableItem *> *items;

@end
