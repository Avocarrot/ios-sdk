//
//  NativeAssetsDetailsViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NativeAssetsDetailsViewController : UIViewController

@property (copy, nonatomic) NSString *adUnitId;

- (void)loadAds;
@end
