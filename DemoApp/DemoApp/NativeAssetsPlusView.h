//
//  NativeAssetsPlusView.h
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVONativeAd;

@interface NativeAssetsPlusView : UIView

@property(weak, nonatomic) IBOutlet UILabel *mainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property(weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property(weak, nonatomic) IBOutlet UILabel *callToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *privacyInfoContainerView;

- (void)fillWithNativeAd:(AVONativeAssets *)nativeAd;

- (NSArray<UIView *> *)clickableSubViews;
@end
