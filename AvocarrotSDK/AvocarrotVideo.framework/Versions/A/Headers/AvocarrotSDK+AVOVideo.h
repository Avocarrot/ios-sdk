//
//  AvocarrotSDK+AVOVideo.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 23.12.15.
//  Copyright © 2015 Glispa GmbH. All rights reserved.
//

#import <AvocarrotCore/Avocarrot.h>
#import "AVOVideo.h"

@interface AvocarrotSDK (AVOVideo)

/**
 *  Load video ads
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - called when video is successfully downloaded, returns downloaded video controller which could be presented modally
 *  @param failure                  - (optional) called when video download fails, returns AVOError
 */
- (void)loadVideoWithAdUnitId:(NSString *_Nonnull)adUnitId
                      success:(void (^ _Nullable)(AVOVideo *_Nonnull video))success
                      failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

@end
