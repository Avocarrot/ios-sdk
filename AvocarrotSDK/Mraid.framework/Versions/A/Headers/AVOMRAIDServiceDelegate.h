//
//  AVOMRAIDServiceDelegate.h
//  AvocarrotSDK
//
//  Created by Glispa GmbH on 10/21/13.
//  Copyright (c) 2013 Glispa GmbH. All rights reserved.
//

static NSString *MRAIDSupportsSMS = @"sms";
static NSString *MRAIDSupportsTel = @"tel";
static NSString *MRAIDSupportsCalendar = @"calendar";
static NSString *MRAIDSupportsStorePicture = @"storePicture";
static NSString *MRAIDSupportsInlineVideo = @"inlineVideo";

// A delegate for MRAIDView/MRAIDInterstitial to listen for notifications when the following events
// are triggered from a creative: SMS, Telephone call, Calendar entry, Play Video (external) and
// saving pictures. If you don't implement this protocol, the default for
// supporting these features for creative will be FALSE.
@protocol AVOMRAIDServiceDelegate <NSObject>

@optional

// These callbacks are to request other services.
- (void)mraidServiceCreateCalendarEventWithEventJSON:(NSString *)eventJSON;

- (void)mraidServicePlayVideoWithUrlString:(NSString *)urlString;

- (void)mraidServiceOpenBrowserWithUrlString:(NSString *)urlString;

- (void)mraidServiceStorePictureWithUrlString:(NSString *)urlString;

@end
