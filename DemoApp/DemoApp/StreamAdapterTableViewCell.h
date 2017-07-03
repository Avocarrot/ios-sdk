//
//  StreamAdapterTableViewCell.h
//  DemoApp
//
//  Created by Glispa GmbH on 21/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreamAdapterTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UIImageView *tweetImageView;
@property(nonatomic, weak) IBOutlet UILabel *tweetTextLabel;
@property(nonatomic, weak) IBOutlet UILabel *tweetNameLabel;


@end
