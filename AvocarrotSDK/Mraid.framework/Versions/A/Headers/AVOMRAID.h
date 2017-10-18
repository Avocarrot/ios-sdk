//
//  AVOMRAID.h
//  Mraid
//
//  Created by Glispa GmbH on 21.08.17.
//
//

#import <UIKit/UIKit.h>

@class AVOAd, AVOMRAID, AVOError;

@protocol AVOMRAIDDelegate <NSObject>

@optional

- (void)mraidWillExpand:(AVOMRAID *)mraid;

- (void)mraidDidClose:(AVOMRAID *)mraid;

- (void)mraid:(AVOMRAID *)mraid navigateWithURL:(NSURL *)url;

- (void)mraidWillPresentFullscreen:(AVOMRAID *)mraid;

- (void)mraidDidPresentFullscreen:(AVOMRAID *)mraid;

- (void)mraidWillDismissFullscreen:(AVOMRAID *)mraid;

- (void)mraidDidDismissFullscreen:(AVOMRAID *)mraid;

- (void)mraid:(AVOMRAID *)mraid createCalendarEventWithEventJSON:(NSString *)eventJSON;

@end

@interface AVOMRAID : NSObject

@property(nonatomic, weak) id <AVOMRAIDDelegate> delegate;

- (instancetype)initWithAd:(AVOAd *)ad;

- (void)mraidViewWithHTML:(NSString *)html
                     size:(CGSize)size
                  success:(void (^)(UIView *mraidView))success
                  failure:(void (^)(AVOError *error))failure;

- (void)mraidViewDidMoveToScreen;

- (void)mraidViewControllerWithHTML:(NSString *)html
                            success:(void (^)(UIViewController *mraidViewController))success
                            failure:(void (^)(AVOError *error))failure;

@end
