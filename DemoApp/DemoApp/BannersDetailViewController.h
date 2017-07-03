//
//  BannersDetailViewController.h
//  DemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannersDetailViewController : UIViewController

@property(copy, nonatomic) NSString *adUnitId;
@property(assign, nonatomic) AVOBannerViewSize bannerSize;

- (void)loadBanner;
@end
