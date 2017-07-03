//
//  InterstitialsDetailViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "InterstitialsDetailViewController.h"
#import "AppControllerManagement.h"

@interface InterstitialsDetailViewController ()

@property(strong, nonatomic) AVOInterstitial *interstitial;
@end

@implementation InterstitialsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Actions

- (IBAction)loadClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadInterstitialWithAdUnitId:self.adUnitId
                                                 success:^(AVOInterstitial *interstitial) {
                                                     __strong __typeof__(self) sSelf = weakSelf;
                                                     sSelf.interstitial = interstitial;
                                                     NSLog(@"Interstitial has loaded!");
                                                 } failure:^(AVOError * _Nonnull error) {
                                                     NSLog(@"Interstitial loading error: %@", [error localizedDescription]);
                                                 }];
}

- (IBAction)showClicked:(id)sender {
    [self.interstitial showFromViewController:self];
}

- (IBAction)loadAndShowClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadInterstitialWithAdUnitId:self.adUnitId
                                              success:^(AVOInterstitial *interstitial) {
                                                  __strong __typeof__(self) sSelf = weakSelf;
                                                  sSelf.interstitial = interstitial;
                                                  [interstitial showFromViewController:sSelf];
                                                  NSLog(@"Interstitial has loaded! And it will be shown...");
                                              } failure:^(AVOError * _Nonnull error) {
                                                  NSLog(@"Interstitial loading error: %@", [error localizedDescription]);
                                              }];
}

- (IBAction)loadAndShowWithDelayClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AvocarrotSDK.sharedSDK loadInterstitialAndShowWithDelayWithAdUnitId:self.adUnitId
                                                       forViewController:self
                                                                 success:^(AVOInterstitial *interstitial) {
                                                                     __strong __typeof__(self) sSelf = weakSelf;
                                                                     sSelf.interstitial = interstitial;
                                                                     NSLog(@"Interstitial has loaded! And it will be shown soon...");
                                                                 }
                                                                 failure:^(AVOError * _Nonnull error) {
                                                                     NSLog(@"Interstitial loading error: %@", [error localizedDescription]);
                                                                 }];
}

@end


@interface InterstitialsDetailViewController (AppManagement) <AppControllerManagement>

@end

@implementation InterstitialsDetailViewController (AppManagement)

- (void)applyUserData:(NSDictionary <NSString *, NSObject *> *)userData {
    if ([userData[@"adUnitId"] isKindOfClass:[NSString class]]) {
        self.adUnitId = (NSString *)userData[@"adUnitId"];
    }
}

@end
