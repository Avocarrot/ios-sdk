//
//  StreamAdapterCollectionViewCell.m
//  DemoApp
//
//  Created by Glispa GmbH on 22/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "StreamAdapterCollectionViewCell.h"


@implementation StreamAdapterCollectionViewCell

- (void)layoutSubviews {
    self.tweetTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetTextLabel.frame);
    self.tweetNameLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetNameLabel.frame);
    [super layoutSubviews];
}

@end
