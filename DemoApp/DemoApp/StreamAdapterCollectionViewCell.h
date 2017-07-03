//
//  StreamAdapterCollectionViewCell.h
//  DemoApp
//
//  Created by Glispa GmbH on 22/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StreamAdapterCollectionViewCell : UICollectionViewCell

@property(nonatomic, weak) IBOutlet UIImageView *tweetImageView;
@property(nonatomic, weak) IBOutlet UILabel *tweetTextLabel;
@property(nonatomic, weak) IBOutlet UILabel *tweetNameLabel;

@property(weak, nonatomic) IBOutlet NSLayoutConstraint *tweetImageHeightConstraint;

@end
