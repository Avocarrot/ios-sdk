//
//  NativeAssetsPlusView.m
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH All rights reserved.
//

#import "NativeAssetsPlusView.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation NativeAssetsPlusView

- (void)fillWithNativeAd:(AVONativeAssets *)nativeAd {
    self.mainTextLabel.text = nativeAd.text;
    self.titleTextLabel.text = nativeAd.title;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:nativeAd.iconURL]];
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:nativeAd.imageURL]];
    [self.privacyInfoContainerView sd_setImageWithURL:[NSURL URLWithString:nativeAd.adChoices.iconUrl]];
    self.callToActionTextLabel.text = nativeAd.callToActionTitle;
}

- (NSArray<UIView *> *)clickableSubViews {
    return @[self.titleTextLabel, self.iconImageView, self.mainImageView, self.callToActionTextLabel];
}

@end
