//
//  VideoDetailViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "VideoDetailViewController.h"
#import "AppControllerManagement.h"


@interface VideoDetailViewController ()

@property(strong, nonatomic) AVOVideo *video;

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions

- (IBAction)loadClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadVideoWithAdUnitId:self.adUnitId
                                          success:^(AVOVideo *video) {
                                              __strong __typeof__(self) sSelf = weakSelf;
                                              sSelf.video = video;
                                              NSLog(@"Video has loaded!");
                                          }
                                          failure:^(AVOError * _Nonnull error) {
                                              NSLog(@"Video loading error: %@", [error localizedDescription]);
                                          }];
}

- (IBAction)showClicked:(id)sender {
    [self.video showFromViewController:self];
}

- (IBAction)loadAndShowClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadVideoWithAdUnitId:self.adUnitId
                                          success:^(AVOVideo *video) {
                                               __strong __typeof__(self) sSelf = weakSelf;
                                              [video showFromViewController:sSelf];
                                              NSLog(@"Video has loaded! And it will be shown...");
                                          }
                                          failure:^(AVOError * _Nonnull error) {
                                               NSLog(@"Video loading error: %@", [error localizedDescription]);
                                           }];
}

@end


@interface VideoDetailViewController (AppManagement) <AppControllerManagement>
@end

@implementation VideoDetailViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
}

@end
