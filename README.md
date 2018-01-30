Table of contents
=================

* [Avocarrot Support](#avocarrot-support)
* [Initialization](#initialization)
* [Adding through Cocoapods](#adding-through-cocoapods)
* [Adding SDK manually](#adding-sdk-manually)
* [Standard banners](#standard-banners)
* [Interstitials](#interstitials)
* [Video Ads](#video-ads)
* [Native assets](#native-assets)
* [Native ads](#native-ads)
* [Stream adapter](#stream-adapter)
* [Native ads provider](#native-ads-provider)
* [Native templates customization](#native-templates-customization)
* [Other](#other)


Avocarrot Support
==============

Additional documentation regarding integration of the Avocarrot SDK into your iOS app can be found under the following links:

- [https://www.avocarrot.com/](https://login.avocarrot.com/register)  -  Sign Up to Avocarrot
- [Avocarrot SDK iOS Quickstart](https://docs.avocarrot.com/ios/getting-started-with-mediation) - Basic integration for testing

Initialization
==============

Avocarrot iOS SDK supports iOS 8.0 or higher.

You can add AvocarrotSDK to your project using [Cocoapods](http://cocoapods.org) (recommended) or [manually](https://github.com/avocarrot/ios-sdk/blob/master/MANUAL_INTEGRATION.md)

Adding through Cocoapods
========================

**Note**:  If you don't have pods in your project, set them up using the [Getting Started guide](https://guides.cocoapods.org/using/getting-started.html)

From version 4.5 Avocarrot SDK uses modular system to distribute based on subspecs:

- By default Avocarrot SDK pod provides SDK with our native assets ad format only, add  pod 'avocarrot-ios-sdk' to your Podfile to integrate it to your project.
- If you want to use custom set of SDK modules, include `pod 'avocarrot-ios-sdk/Core` to your Podfile and then select additional modules below.


*Native assets adapters*


- If you want to use the Avocarrot native assets with server-side mediated networks only, add pod 'avocarrot-ios-sdk/NativeAssets' to your Podfile

- If you want to use the Avocarrot native assets with all server-side mediated networks including client side SDKs, add pod 'avocarrot-ios-sdk/NativeAssetsAdapters' to your Podfile

- For native assets, if you want to select which client networks SDK to be included with server side mediated networks, refer to the pods specified below to add into your Podfile:

- `pod 'avocarrot-ios-sdk/NativeAssetsAdapters/FBAudienceAdapter'` - Avocarrot native assets and adapter for  [Facebook Audience](https://developers.facebook.com/docs/ios) native assets
- `pod 'avocarrot-ios-sdk/NativeAssetsAdapters/GoogleMobileAdsAdapter'` - Avocarrot native assets and adapter for  [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) native assets
- `pod 'avocarrot-ios-sdk/NativeAssetsAdapters/AppLovinAdapter'` - Avocarrot native assets and adapter for  [AppLovin](https://www.applovin.com/) native assets
- `pod 'avocarrot-ios-sdk/NativeAssetsAdapters/InLocoAdapter'` - Avocarrot native assets and adapter for  [InLoco](http://docs.inlocomedia.com/docs/ios) native assets


*Banners*

- If you want to use the Avocarrot banners with server-side mediated networks only, add pod 'avocarrot-ios-sdk/Banner' to your Podfile

- If you want to use the Avocarrot banners with all server-side mediated networks including client side SDKs, add pod 'avocarrot-ios-sdk/BannerAdapters' to your Podfile

- For Banners, If you want to select which client networks SDK to be included with server side mediated networks, refer to the pods specified below to add into your Podfile:

    - `pod 'avocarrot-ios-sdk/BannerAdapters/FBAudienceAdapter'` - Avocarrot banners and adapter for  [Facebook Audience](https://developers.facebook.com/docs/ios) banners
    - `pod 'avocarrot-ios-sdk/BannerAdapters/GoogleMobileAdsAdapter'` - Avocarrot banners and adapter for  [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) banners
    - `pod 'avocarrot-ios-sdk/BannerAdapters/MopubAdapter'` - Avocarrot banners and adapter for  [MoPub](https://github.com/mopub/mopub-ios-sdk) banners
    - `pod 'avocarrot-ios-sdk/BannerAdapters/InLocoAdapter'` - Avocarrot banners and adapter for  [InLoco](http://docs.inlocomedia.com/docs/ios) banners


*Interstitials*

- If you want to use the Avocarrot interstitials with server-side mediated networks only, add pod 'avocarrot-ios-sdk/Interstitial' to your Podfile

- If you want to use the Avocarrot interstitials with all server-side mediated networks including client side SDKs, add pod 'avocarrot-ios-sdk/InterstitialAdapters' to your Podfile

- For Interstitials, if you want to select which client networks SDK to be included with server side mediated networks, refer to the pods specified below to add into your Podfile:

    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/FBAudienceAdapter'` - Avocarrot interstitials and adapter for  [Facebook Audience](https://developers.facebook.com/docs/ios) interstitials
    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/GoogleMobileAdsAdapter'` - Avocarrot interstitials and adapter for  [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) interstitials
    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/MopubAdapter'` - Avocarrot interstitials and adapter for  [MoPub](https://github.com/mopub/mopub-ios-sdk) interstitials
    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/ChartboostAdapter'` - Avocarrot interstitials and adapter for  [Chartboost](http://cboo.st/ios_v6-3) interstitials
    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/AppLovinAdapter'` - Avocarrot interstitials and adapter for  [AppLovin](https://www.applovin.com/) interstitials
    - `pod 'avocarrot-ios-sdk/InterstitialAdapters/InLocoAdapter'` - Avocarrot interstitials and adapter for  [InLoco](http://docs.inlocomedia.com/docs/ios) interstitials


*Videos*

- If you want to use the Avocarrot videos with server-side mediated networks, only add `pod 'avocarrot-ios-sdk/Video'` to your Podfile

- If you want to use the Avocarrot videos with all server-side mediated networks including client side SDKs, add pod 'avocarrot-ios-sdk/VideoAdapters' to your Podfile

- For videos, if you want to select which client networks SDK to be included with server side mediated networks, refer to the pods specified below to add into your Podfile:

    - `pod 'avocarrot-ios-sdk/VideoAdapters/ChartboostAdapter'` - Avocarrot banners and adapter for  [Chartboost](http://cboo.st/ios_v6-3) videos
    - `pod 'avocarrot-ios-sdk/VideoAdapters/UnityAdsAdapter'` - Avocarrot banners and adapter for  [Unity Ads](https://github.com/Applifier/unity-ads-sdk) videos
    - `pod 'avocarrot-ios-sdk/VideoAdapters/VungleAdapter'` - Avocarrot banners and adapter for  [Vungle](https://v.vungle.com/sdk) videos


*Rendered native ads*

- If you want to use the Avocarrot native views with server-side mediated networks only, add `pod 'avocarrot-ios-sdk/NativeView'` to your Podfile

- If you want to use the Avocarrot native views with all server-side mediated networks including client side SDKs, add pod 'avocarrot-ios-sdk/NativeViewAdapters' to your Podfile

- For native views, if you want to select which client networks SDK to be included with server side mediated networks, refer to the pods specified below to add into your Podfile:

    - `pod 'avocarrot-ios-sdk/NativeViewAdapters/FBAudienceAdapter'` - Avocarrot native views and adapter for  [Facebook Audience](https://developers.facebook.com/docs/ios) native views
    - `pod 'avocarrot-ios-sdk/NativeViewAdapters/GoogleMobileAdsAdapter'` - Avocarrot native views and adapter for  [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) native views
    - `pod 'avocarrot-ios-sdk/NativeViewAdapters/MopubAdapter'` - Avocarrot native views and adapter for  [MoPub](https://github.com/mopub/mopub-ios-sdk) native views
    - `pod 'avocarrot-ios-sdk/NativeViewAdapters/AppLovinAdapter'` - Avocarrot native views and adapter for  [AppLovin](https://www.applovin.com/) native views
    - `pod 'avocarrot-ios-sdk/NativeViewAdapters/InLocoAdapter'` - Avocarrot native views and adapter for  [InLoco](http://docs.inlocomedia.com/docs/ios) native views


**Warning: Avocarrot SDK 4.8.0 was designed and verified to work correctly with the following versions of 3rd party ad network SDKs:**

* Chartboost – 6.6.3
* Google Mobile Ads – 7.27.2
* Unity Ads – 2.1.2
* Vungle – 4.1.0
* Facebook Audience – 4.26.0
* MoPub – 4.19.0
* AppLovin – 4.6
* InLoco - 2.4.4

**Warning: Some Xcode versions support new settings only after the Xcode reboot. This also cleans the Xcode cache and remedies other problems.**

TO DO list if you have a linking problem:

- Clean Build
- Restart Xcode
- Delete your DerivedData folder in `~/Library/Developer/Xcode/DerivedData`
- Restart the computer

ATS settings in iOS 9.0 and greater
===================================
Since the Avocarrot SDK uses 3rd party networks to load ads and we have no control over these networks loading their content via https, you should disable ATS for your application to ensure the Avocarrot SDK behaves as intended. To disable ATS add the following settings to your application Info.plist file:

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key><true/>
    <key>NSAllowsArbitraryLoadsForMedia</key><true/>
    <key>NSAllowsArbitraryLoadsInWebContent</key><true/>
</dict>
```

Standard banners
================

AdUnitId for testing (STANDARD): `"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"`
Available banner sizes:

- AVOBannerViewSizeSmall (320x50) (recommended)
- AVOBannerViewSizeLarge (728x90)

Use the following methods in your UIViewController subclass:

```objective-c
- (void)loadBannerWithSize:(AVOBannerViewSize)size
                  adUnitId:(NSString *_Nonnull)adUnitId
                   success:(void (^ _Nullable)(AVOBannerView *_Nonnull bannerAd))success
                   failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

For example:

*objective-c*

```objective-c
#import <AvocarrotBanner/AvocarrotSDK+AVOBannerView.h>
...
[self.bannerView stop];
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadBannerWithSize:AVOBannerViewSizeSmall
                                  adUnitId:@"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"
                                   success:^(AVOBannerView * _Nonnull bannerAd) {
                                       __strong __typeof__(self) sSelf = weakSelf;
                                       sSelf.bannerView = bannerAd;
                                       [sSelf.view addSubview:bannerAd];
                                 } failure:nil];
```
*swift*

```swift
import AvocarrotBanner
...
if bannerView != nil {
    bannerView?.stop()
    bannerView?.removeFromSuperview()
    bannerView = nil
}

AvocarrotSDK.shared.loadBanner(with: AVOBannerViewSizeSmall,
                               adUnitId: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69",
                               success: { [weak self] (bannerAd) in
                                           guard let sSelf = self else {
                                               return
                                           }
                                           sSelf.bannerView = bannerAd
                                           sSelf.view.addSubview(bannerAd)
                               }, failure: nil)
```

Add the following code to `viewDidAppear` and `viewWillDisappear` methods:

*objective-c*

```objective-c
#import <AvocarrotBanner/AvocarrotSDK+AVOBannerView.h>
...
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.bannerView resumeAutoUpdate];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.bannerView pauseAutoUpdate];
}
```

*swift*

```swift
import AvocarrotBanner
...
override func viewDidAppear(animated: Bool) {
    bannerView?.resumeAutoUpdate()
}


override func viewDidDisappear(animated: Bool) {
    bannerView?.pauseAutoUpdate()
}
```

If you want to switch banner auto-update off:

```objective-c
self.bannerView.autoUpdate = NO;
```

If you want to stop and remove banner from screen:

```objective-c
[self.bannerView stop];
```

### Standard banner events handling

To process banner events, you should implement blocks or subscribe to notifications:

| Method | Description  | `NSNotificationCenter` key |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------------------|
|` (void (^ _Nullable)(void))success `|    Called after the banner is served successfully. | |
|` (void (^ _Nullable)(AVOError *_Nonnull error))failure `| Called if the banner was not downloaded.| |
|`- (instancetype _Nonnull)onClick:(nullable void (^)(void))block`| Called after a click on a banner. After this event app will be minimized and an external browser will be opened. | `kAVONotification_BannerClicked` |


Interstitials
=============

AdUnitId for testing (INTERSTITIAL): `"2cb34a73-0012-4264-9526-bde1fce2ba92"`.
Interstitial size is defined automatically, depending on the screen size.
Use the following methods in your UIViewController subclass:

*objective-c*

```objective-c
- (void)loadInterstitialWithAdUnitId:(NSString *_Nonnull)adUnitId
        success:(void (^ _Nullable)(AVOInterstitial *_Nonnull interstitial))success
        failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

- (void)loadInterstitialAndShowWithDelayWithAdUnitId:(NSString *_Nonnull)adUnitId
        forViewController:(UIViewController *_Nonnull)viewController
        success:(void (^ _Nullable)(AVOInterstitial *_Nonnull interstitial))success
        failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;                           
```


Two different presentation methods are available for interstitials. These are as follows:

- `loadInterstitialWithAdUnitId`
- `loadInterstitialAndShowWithDelayWithAdUnitId`


The `loadInterstitialWithAdUnitId` method is to load the interstitial and call the success block if the interstitial loaded. You can show the interstitial from this block immediately. The `loadInterstitialAndShowWithDelayWithAdUnitId` method loads the interstitial, calls the success block and shows it after a delay, which returns from the server. From the success block you can save it to your UIViewController subclass property, show it immediately or do nothing.

**Note: If delay is not specified, the interstitial will be shown immediately after the load is finished.**


For example:

*objective-c*

```objective-c
#import <AvocarrotInterstitial/AvocarrotSDK+AVOInterstitial.h>
...
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadInterstitialWithAdUnitId:@"2cb34a73-0012-4264-9526-bde1fce2ba92"
                     success:^(AVOInterstitial * _Nonnull interstitial) {
                        __strong __typeof__(self) sSelf = weakSelf;
                        sSelf.intestitial = interstitial;
                        [interstitial showFromViewController:sSelf];
                    } failure:nil];

[AvocarrotSDK.sharedSDK loadInterstitialAndShowWithDelayWithAdUnitId:@"2cb34a73-0012-4264-9526-bde1fce2ba92"
                     forViewController:self
                     success:^(AVOInterstitial * _Nonnull interstitial) {
                       __strong __typeof__(self) sSelf = weakSelf;
                       sSelf.intestitial = interstitial;
                     } failure:nil];

```

*swift*

```swift
import AvocarrotInterstitial
...
AvocarrotSDK.shared.loadInterstitial(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92",
                                  success: { [weak self] (interstitial) in
                                      guard let sSelf = self else {
                                         return
                                      }
                                      sSelf.interstitial = interstitial
                                      interstitial.show(from: sSelf)
                               }, failure: nil)

AvocarrotSDK.shared.loadInterstitialAndShowWithDelay(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92",
                                                  for: self,
                                                  success: { [weak self] (interstitial) in
                                                      guard let sSelf = self else {
                                                         return
                                                      }
                                                      sSelf.interstitial = interstitial
                                               }, failure: nil)
```
### Interstitial events handling

To process interstitial events, you should implement blocks or subscribe to notifications. The following is available:

| Method | Description  | `NSNotificationCenter` key |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^ _Nullable)(AVOInterstitial` `*_Nonnull interstitial))success `| Called after the interstitial is served. After this method is called, the interstitial is ready to be displayed.| |
|`(void (^ _Nullable)(AVOError *_Nonnull error))failure `| Called if the interstitial was not downloaded.| |
|`- (instancetype _Nonnull)onClick:(nullable void (^)(void))block`|	Called after a click on the interstitial. After this event an external browser or a SKStoreProductViewController will be opened. | `kAVONotification_InterstitialClicked` |
|`- (instancetype _Nonnull)onDidHide:(nullable void (^)(void))block`| Called after the interstitial disappears from the screen.| `kAVONotification_InterstitialDidHide`|
|`- (instancetype _Nonnull)onDidShow:(nullable void (^)(void))block`|	Called after the interstitial is displayed.| `kAVONotification_InterstitialDidShow` |
|`- (instancetype _Nonnull)onWillHide:(nullable void (^)(void))block `| Called after the tap on the "close" button, directly before the interstitial disappears.| `kAVONotification_InterstitialWillHide`|
|` - (instancetype _Nonnull)onWillLoad:(nullable void (^)(void))block`| Called before sending interstitial request to server.| `kAVONotification_InterstitialWillLoad` |
|` - (instancetype _Nonnull)onWillShow:(nullable void (^)(void))block`| Called before displaying the interstitial.| `kAVONotification_InterstitialWillShow`|



Video Ads
=========

ID of video ad space for testing (VIDEO): `"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"`

Use the following methods in your UIViewController subclass:

*objective-c*

```objective-c
- (void)loadVideoWithAdUnitId:(NSString *_Nonnull)adUnitId
        success:(void (^ _Nullable)(AVOVideo *_Nonnull video))success
        failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

For example:

*objective-c*

```objective-c
#import <AvocarrotVideo/AvocarrotSDK+AVOVideo.h>
...
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadVideoWithAdUnitId:@"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"
                     success:^(AVOVideo *video) {
                        __strong __typeof__(self) sSelf = weakSelf;
                        [video showFromViewController:sSelf];
                     } failure:nil];
```

*swift*

```swift
import AvocarrotVideo
...
AvocarrotSDK.shared.loadVideo(withAdUnitId: "87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: { [weak self]
    video in
    guard let sSelf = self else {
       return
    }
    video.show(from: sSelf)
}, failure: nil)
```
### Video events handling

To process video ad events, you should implement blocks or subscribe to notifications. The following is available:

| Method | Description  | `NSNotificationCenter` key |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^ _Nullable)(AVOVideo *_Nonnull video))success `| Called after the video is served. After this method is called, the video ad is ready to be displayed. | |
|`(void (^ _Nullable)(AVOError *_Nonnull error))failure `| Called if the video ad was not downloaded. | |
|` - (instancetype _Nonnull)onWillShow:(nullable void (^)(void))block`| Called when the video will show (will be shown). | `kAVONotification_VideoWillShow` |
|` - (instancetype _Nonnull)onDidShow:(nullable void (^)(void))block`| Called when the video did show (is shown). | `kAVONotification_VideoDidShow` |
|` - (instancetype _Nonnull)onWillHide:(nullable void (^)(void))block`| Called when the video will hide (will be closed). | `kAVONotification_VideoWillHide` |
|` - (instancetype _Nonnull)onDidHide:(nullable void (^)(void))block`| Called when the video is hidden (is closed). | `kAVONotification_VideoDidHide` |
|` - (instancetype _Nonnull)onStart:(nullable void (^)(void))block`| Called when the video is started. | `kAVONotification_VideoStarted` |
|` - (instancetype _Nonnull)onPause:(nullable void (^)(void))block`| Called when the video is paused. | `kAVONotification_VideoPause` |
|` - (instancetype _Nonnull)onResume:(nullable void (^)(void))block`| Called when the video is resumed. | `kAVONotification_VideoResume` |
|` - (instancetype _Nonnull)onComplete:(nullable void (^)(void))block`| Called when showing of a video has been completed. | `kAVONotification_VideoCompleted` |
|` - (instancetype _Nonnull)onWillLoad:(nullable void (^)(void))block`| Called before sending the video request to server. | `kAVONotification_VideoWillLoad` |
|` - (instancetype _Nonnull)onClick:(nullable void (^)(void))block`| Called after a click on the video. After this event an external browser or a SKStoreProductViewController will be opened. | `kAVONotification_VideoClicked` |


Native assets
==========

AdUnitId for testing (Native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

Our native assets are raw ad data without any pre-defined wrapping UI. We only request the container of this data for event registration.
The layout for a native assets is configured by developers with the help of the Interface Builder (creating .xib file) or manual creation of UI controls in code.
Use the following methods in your UIViewController subclass:

*objective-c*

```objective-c
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
        success:(UIView * _Nullable (^ _Nonnull)(AVONativeAssets *_Nonnull nativeAd))success
        failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

*swift*

```swift
func loadNativeAd(withAdUnitId adUnitId: String,
                  success: @escaping (AVONativeAssets) -> UIView?,
                  failure: ((AVOError) -> ()))?)
```

The following method performs asynchronous downloading: raw native data without downloading linked resources and requests a container view for this data.

There is a common algorithm to use when implementing a custom native ad:

1. Create your own subclass of `UIView` with any name (`MyNativeBannerView` for example) which will be used as ad view container.
2. Render the other controls such as labels, buttons and image views, in the ad view container.  
3. Call `loadNativeAdWithAdUnitId: etc` with the required parameters, where the adUnitId is your private advertising space ID. Success block will be called when the native ad is successfully downloaded.
    Method returns the raw data object `AVONativeAssets` and requests your ad container where the ad will be rendered (required for registration of clicks and impressions), you can register ad container for interaction later by using this method of `AVONativeAssets`:
    `- (instancetype _Nonnull)registerViewForInteraction:(nonnull UIView *)view forClickableSubviews:(nullable NSArray<UIView *> *)subviews`,
    also you can display `AdChoices` icon and register it for click processing and redirecting user to AdChoices program website:
    `- (instancetype _Nonnull)registerAdChoicesView:(nonnull UIView *)adChoicesView`, failure block will be called when the native ad download fails, and returns `AVOError`
4. Show the ad container on the screen.


For example:

*objective-c*

```objective-c
#import <AvocarrotNativeAssets/AvocarrotSDK+AVONativeAssets.h>
...
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:self.unitID
                     success:^UIView * _Nonnull(AVONativeAssets * _Nonnull nativeAd) {
                            __strong __typeof__(self) sSelf = weakSelf;
                            CustomNativeView *nativeView = [CustomNativeView new];
                            [nativeView fillWithNativeAd:nativeAd];

                            [[[[nativeAd onImpression:^{
                                NSLog(@"Ad Impressed");
                            }] onClick:^{
                                NSLog(@"Ad Clicked");
                            }] onLeftApplication:^{
                                NSLog(@"Left application");
                            }] registerViewForInteraction:nativeView forClickableSubviews:nil];

                            [sSelf.view addSubview:nativeView];

                            return nativeView;
                     } failure:^(AVOError * _Nonnull error) {
                            NSLog(@"Native ad loading error: %@", [error localizedDescription]);
}];
```
*swift*

```swift
import AvocarrotNativeAssets
...
AvocarrotSDK.shared.loadNativeAd(withAdUnitId: "",
                 success: { [weak self] (ad: AVONativeAssets) -> UIView? in
                        guard let sSelf = self else {
                           return
                        }
                        let containerView = CustomNativeView()
                        containerView.fillWithNativeAd(ad)

                        ad.onClick({
                            print("Clicked")
                        }).onImpression({
                            print("Impressed")
                        }).onLeftApplication({
                            print("Left application")
                        }).registerView(forInteraction: containerView, forClickableSubviews: nil)

                        sSelf.view.addSubview(containerView)

                        return containerView

                 }) { (error) in
                        print("Native ad loading error: \(error.localizedDescription)")
}
```

To process custom native ad events, you should implement blocks. The following is available:

| Method | Description |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`- (instancetype _Nonnull)onImpression:(nullable void (^)(void))impression `| Called when ad impression has been counted. |
|`- (instancetype _Nonnull)onClick:(nullable void (^)(void))click `| Called when ad click has been counted. |
|`- (instancetype _Nonnull)onLeftApplication:(nullable void (^)(void))leftApplication `| Called when application has been left after click. |


Native ads
==========

AdUnitId for testing (Native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

A native ad is a raw representation of an ad without any pre-defined wrapping UI, which gives developers the freedom to design and control the ad, or for the easiest integration you could use our customizable templates: *List*, *Feed*, *Grid* and *GridIcon* based on `AVONativeAdsTemplateType` enum. You can also choose *Server* template (i.e Dynamic Template), which will be downloaded from the server based on your color preferences. The main advantage of this template  is the possibility to change the color scheme of the native ad after your app has been uploaded to the AppStore. The full list of templates is available in the `AVONativeAdsTemplateType` enum.

Use this method to represent native ads by our templates:

*objective-c*

```objective-c
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
            parentViewController:(UIViewController *_Nonnull)viewController
                    templateType:(AVONativeAdsTemplateType)templateType
                         success:(void (^ _Nullable)(UIView *_Nonnull adNativeViewContainer))success
                         failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure
           templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;
```

*swift*

```swift
func loadNativeAd(withAdUnitId adUnitId: String,
                  parentViewController viewController: UIViewController,
                  templateType: AVONativeAdsTemplateType,
                  success: ((UIView) -> ())?,
                  failure: ((AVOError) -> ())?,
                  templateCustomization: ((AVOTemplateCustomizationObject) -> ())?)
```

List of available template customizations is [here](#native-templates-customization)

For example:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:@"7f900c7d-7ce3-4190-8e93-310053e70ca2"
                             parentViewController:self
                                     templateType:AVONativeAdsTemplateTypeList
                                          success:^(UIView * _Nonnull adNativeViewContainer) {
                                              [weakSelf.view addSubview:adNativeViewContainer];
                                          } failure:nil
                            templateCustomization:nil];
```
*swift*

```swift
import AvocarrotNativeView
...
AvocarrotSDK.shared.loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                      parentViewController: self,
                                      templateType: .list,
                                      success: { [unowned self] (view) in
                                        self.view.addSubview(view)
            }, failure: nil,
               templateCustomization: nil)
```

The custom layout for a native ad is configured by developers with the help of the Interface Builder (creating .xib file) or manual creation of UI controls in code.
Use the following methods in your `UIViewController` subclass:

*objective-c*

```objective-c
- (void)loadNativeAdWithAdUnitId:(NSString *_Nonnull)adUnitId
        parentViewController:(UIViewController *_Nonnull)viewController
        adViewClassForRendering:(Class _Nonnull)adViewClass
        success:(void (^ _Nullable)(UIView *_Nonnull adNativeViewContainer))success
        failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

*swift*

```swift
func loadNativeAd(withAdUnitId adUnitId: String,
                      parentViewController viewController: UIViewController,
                      adViewClassForRendering adViewClass: AnyClass,
                      success: ((UIView) -> ())?,
                      failure: ((AVOError) -> ())?)
```

The following method performs async downloading of native ads with all linked resources and renders ad data into bound UI controls after that.

There is a common algorithm to use when implementing a native ad:

1. Create your own subclass of `AVONativeView` with any name (`MyNativeBannerView` for example)
2. Choose one of two options:
	* XIB option - Design the layout of `MyNativeBannerView` in a separate XIB file. The developer should bind the  desired UI controls in this XIB and properties from `<AVONativeViewInterface>`, which `AVONativeView` adopts. The implementation of `MyNativeBannerView` class has to override `+ (NSString *)xibName` method, which returns the name of the same XIB.   
	* Coding option - The implementation of `MyNativeBannerView` class must be performed by the creation and placement of UI controls using `<AVONativeViewInterface>`, which `AVONativeView` adopts.
3. Call `loadNativeAdWithAdUnitId: etc` with the required parameters, where the `adUnitId` is your private advertising space ID and className is the name of the `MyNativeBannerView` class. After downloading the ad data, the SDK immediately initiates `MyNativeBannerView` class created in step 2. After, the SDK renders the native ad data inside the controls boundaries. Not all controls are filled this way, but only the main ones:`avoTitleTextLabel, avoMainTextLabel,  avoIconImageView, avoMainMediaView`. When the rendering has finished, the successful completion block with this instance will be called.
4. Show native ad view container on the screen.

For example:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
__weak typeof(self) weakSelf = self;
[AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:@"7f900c7d-7ce3-4190-8e93-310053e70ca2"
                       parentViewController:self
                       classForRendering:NSStringFromClass([MyNativeBannerView class])
                       success:^(UIView *adNativeViewContainer) {
                           __strong __typeof__(self) sSelf = weakSelf;
                           UIView *nativeView = adNativeViewContainer;
                           nativeView.frame = sSelf.adContainerView.bounds;
                           [sSelf.adContainerView addSubview:nativeView];
                       } failure:^(NSError *error) {
}];
```
*swift*

```swift
import AvocarrotNativeView
...
AvocarrotSDK.shared.loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController: self, adViewClassForRendering: classForRendering, success: {
    [weak self] (nativeview) in
    guard let sSelf = self else {
       return
    }
    nativeview.frame = sSelf.adContainerView.bounds
    sSelf.adContainerView.addSubview(nativeview)
}, failure: nil)
```

To process native view events, you should implement blocks. The following is available:

| Method | Description  | `NSNotificationCenter` key |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`- (instancetype _Nonnull)onImpression:(nullable void (^)(void))impression `| Called when ad impression has been counted. | `kAVONotification_NativeAssetsImpressed` |
|`- (instancetype _Nonnull)onClick:(nullable void (^)(void))click `| Called when ad click has been counted. | `kAVONotification_NativeAssetsClicked` |
|`- (instancetype _Nonnull)onLeftApplication:(nullable void (^)(void))leftApplication `| Called when application has been left after click. | `kAVONotification_NativeAssetsLeftApplication` |

Stream adapter
================

AdUnitId for testing (like for native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

Stream adapter is a smart technology to add native ads as items in your feeds based on *UITableView* or *UICollectionView*. Settings for stream adapter are returned from the server side and you can change it as you wish.

To simplify integration for Stream Adapter you can use our customizable templates: *List*, *Feed*, *Grid* and *GridIcon* based on `AVONativeAdsTemplateType` enum:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (void)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                   parentViewController:(UIViewController *_Nonnull)viewController
                               adUnitId:(NSString *_Nonnull)adUnitId
                           templateType:(AVONativeAdsTemplateType)templateType
                               delegate:(id <AVOTableViewStreamAdapterDelegate> _Nullable)delegate
                  templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization
                                success:(void (^ _Nullable)(AVOTableViewStreamAdapter *_Nonnull streamAdapter))success
                                failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;


- (void)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                        parentViewController:(UIViewController *_Nonnull)viewController
                                    adUnitId:(NSString *_Nonnull)adUnitId
                                templateType:(AVONativeAdsTemplateType)templateType
                                    delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                       templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization
                                     success:(void (^ _Nullable)(AVOCollectionViewStreamAdapter *_Nonnull streamAdapter))success
                                     failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

*swift*

```swift
import AvocarrotNativeView
...
func createStreamAdapter(for tableView: UITableView,
                         parentViewController viewController: UIViewController,
                         adUnitId: String,
                         templateType: AVONativeAdsTemplateType,
                         delegate: AVOTableViewStreamAdapterDelegate?,
                         templateCustomization: ((AVOTemplateCustomizationObject) -> ())?,
                         success:((AVOTableViewStreamAdapterDelegate) -> ())?,
                         failure:((AVOError) -> ())?)

func createStreamAdapter(for collectionView: UICollectionView,
                         parentViewController viewController: UIViewController,
                         adUnitId: String,
                         templateType: AVONativeAdsTemplateType,
                         delegate: AVOCollectionViewStreamAdapterDelegate?,
                         templateCustomization: ((AVOTemplateCustomizationObject) -> ())?,
                         success:((AVOCollectionViewStreamAdapter) -> ())?,
                         failure:((AVOError) -> ())?)
```

List of available template customizations is [here](#native-templates-customization)

If you want to use your own representation of a native ad, use these methods:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (void)createStreamAdapterForTableView:(UITableView *_Nonnull)tableView
                   parentViewController:(UIViewController *_Nonnull)viewController
                               adUnitId:(NSString *_Nonnull)adUnitId
                              delegate:(id <AVOTableViewStreamAdapterDelegate> _Nullable)delegate
               adViewClassForRendering:(Class _Nonnull)adViewClass
                               success:(void (^ _Nullable)(AVOTableViewStreamAdapter *_Nonnull streamAdapter))success
                               failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;

- (void)createStreamAdapterForCollectionView:(UICollectionView *_Nonnull)collectionView
                        parentViewController:(UIViewController *_Nonnull)viewController
                                    adUnitId:(NSString *_Nonnull)adUnitId
                                    delegate:(id <AVOCollectionViewStreamAdapterDelegate> _Nullable)delegate
                     adViewClassForRendering:(Class _Nonnull)adViewClass
                                     success:(void (^ _Nullable)(AVOCollectionViewStreamAdapter *_Nonnull streamAdapter))success
                                     failure:(void (^ _Nullable)(AVOError *_Nonnull error))failure;
```

*swift*

```swift
import AvocarrotNativeView
...
func createStreamAdapter(for tableView: UITableView,
                         parentViewController viewController: UIViewController,
                         adUnitId: String,
                         delegate: AVOTableViewStreamAdapterDelegate?,
                         adViewClassForRendering adViewClass: AnyClass,
                         success:((AVOTableViewStreamAdapterDelegate) -> ())?,
                         failure:((AVOError) -> ())?)

func createStreamAdapter(for collectionView: UICollectionView,
                         parentViewController viewController: UIViewController,
                         adUnitId: String,
                         delegate: AVOCollectionViewStreamAdapterDelegate?,
                         adViewClassForRendering adViewClass: AnyClass,
                         success:((AVOCollectionViewStreamAdapter) -> ())?,
                         failure:((AVOError) -> ())?)
```

These methods work the same way as [Native Ads](#native-ads). You have to use the instructions of this type of ad to set `adViewClass` field in methods, but you need to implement `AVOCollectionViewStreamAdapterDelegate` protocol or set `estimatedItemSize` property of your `UICollectionViewFlowLayout`.

For `UITableView` you have to do nothing in `UITableViewDelegate` and `UITableViewDataSource` methods to add ads in your feed, native ads will be added automatically.

For `UICollectionView` you have to do nothing in `UICollectionViewDelegate` and `UICollectionViewDelegate` methods to add ads in your feed, native ads will be added automatically. Only `UICollectionViewFlowLayout` is supported. To add ads to custom layout `UICollectionView` use `AVONativeAdsProvider` class.

**Note for custom collection view layout: if you want to know the original index path of a cell in your feed without ads use this method (it may be important to load data from your data array):**

```objective-c
- (NSIndexPath * _Nullable)originalIndexPath:(NSIndexPath * _Nonnull)indexPath;
```

If you want to use methods of `UITableView` and `UICollectionView` which work with `NSIndexPath` please use `UITableView (AVOStreamAdapter)` and `UICollectionView (AVOStreamAdapter)` categories (declared in `AVOTableViewStreamAdapter.h` and `AVOCollectionViewStreamAdapter.h`). There categories contain methods with `avo_` prefix which return original indexPaths.

To process stream adapter events, you should implement blocks or subscribe to notifications. The following is available:

| Method | Description  | `NSNotificationCenter` key |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`- (instancetype _Nonnull)onAdsDidLoad:(nullable void (^)(void))block `|  Called after ads for stream adapter have been loaded. After this event you can reload your UITableView/UICollectionView or could wait - ads will be added automatically during scrolling. | `kAVONotification_StreamAdapterAdsDidLoad` |
|`- (instancetype _Nonnull)onAdsFailed:(nullable void (^)(void))block `|  Called after ads for stream adapter failed to load. | `kAVONotification_StreamAdapterAdsFailed` |

**Note: Currently stream adapter doesn't support dynamic modification of data source (insert, move, delete of items). This support will be added soon.**

To delete ads from your `UITableView` or `UICollectionView` just use that code:

*objective-c*

```objective-c
[self.tableView resetStreamAdapter];
[self.collectionView resetStreamAdapter];
```

*swift*

```swift
tableView.resetStreamAdapter()
collectionView.resetStreamAdapter()
```

Native ads provider
=====

AdUnitId for testing (like for native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

Native ads provider is more flexible approach to add rendered native ads for `UITableView` or `UICollectionView` instead of the complex Stream Adapter classes (`AVOTableViewStreamAdapter` or `AVOCollectionViewStreamAdapter`).

To simplify integration for both Stream Adapter and Native Ads Provider you can use our customizable templates: *List*, *Feed*, *Grid* and *GridIcon* based on `AVONativeAdsTemplateType` enum.

To create `AVONativeAdsProvider` object use this method:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (AVONativeAdsProvider *_Nonnull)createNativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId
                                                      templateType:(AVONativeAdsTemplateType)templateType
                                                          userData:(NSDictionary <NSString *, id> * _Nullable)userData
                                             templateCustomization:(void (^ _Nullable)(AVOTemplateCustomizationObject *_Nonnull templateCustomizationObject))templateCustomization;
```

*swift*

```swift
import AvocarrotNativeView
...
func createNativeAdsProvider(forAdunit adUnitId: String,
                             templateType: AVONativeAdsTemplateType,
                             userData: [String: id]?,
                             templateCustomization: ((_ templateCustomizationObject: AVOTemplateCustomizationObject) -> Void)? = nil) -> AVONativeAdsProvider
```

List of available template customizations is [here](#native-templates-customization)

Also if you want to use your own representation of a native ad, use this method:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (AVONativeAdsProvider *_Nonnull)createNativeAdsProviderForAdunit:(NSString *_Nonnull)adUnitId
                                           adViewClassForRendering:(Class _Nonnull)adViewClass
                                                          userData:(NSDictionary <NSString *, id> * _Nullable)userData;
```

*swift*

```swift
import AvocarrotNativeView
...
func createNativeAdsProvider(forAdunit adUnitId: String,
                             adViewClassForRendering adViewClass: AnyClass,
                             userData: [String: id]?) -> AVONativeAdsProvider;
```

After creating `AVONativeAdsProvider` object you have to preload need amount of ads by using this method of `AVONativeAdsProvider`:


*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (void)preloadAdsInCache:(NSUInteger)preloadCount
     parentViewController:(UIViewController *_Nonnull)viewController
                  didLoad:(void (^ _Nullable)(NSUInteger preloadCount))successBlock
                  didFail:(void (^ _Nullable)(AVOError *_Nonnull error))errorBlock;
```

*swift*

```swift
import AvocarrotNativeView
...
func preloadAds(inCache preloadCount: Int,
                parentViewController viewController: UIViewController,
                didLoad successBlock: ((_ preloadCount: Int) -> Void)? = nil,
                didFail errorBlock: ((_ error: AVOError) -> Void)? = nil)
```

After getting success callback you are able to get rendered native ads from your  `AVONativeAdsProvider` object by using this method:

*objective-c*

```objective-c
#import <AvocarrotNativeView/AvocarrotNativeView.h>
...
- (AVONativeView* _Nullable)getNextAdView;
```

*swift*

```swift
import AvocarrotNativeView
...
func getNextAdView() -> AVONativeView?
```

**Note: This method gets next native ad from the ring cache. Each ad will be inserted repeatedly every 'preloadCount' interval until it's tapped or impression is counted and as result ad is automatically replaced with a new one.**


Native templates customization
=====

To customize our templates use AVOTemplateCustomizationObject instance which is returned in each native request method.
List of available customizations:

| Property of the AVOTemplateCustomizationObject | Description  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`avoBackgroundColor `| Color of the ad cells |
|`avoTitleFont `| Font of the title label in the ad cells |
|`avoTitleColor `| Text color of the title label in the ad cells |
|`avoTitleLeftOffset `| Left offset for the title label in the ad cells|
|`avoTitleRightOffset `| Right offset for the title label in the ad cells|
|`avoTitleTextStyle `| Text style for the title label in the ad cells (could be uppercase, lowercase, capitalize and default)|
|`avoDescriptionTextFont `| Font of the description label in the ad cells |
|`avoDescriptionTextColor `| Text color of the description label in the ad cells |
|`avoDescriptionTextLeftOffset `| Left offset for the description label in the ad cells|
|`avoDescriptionTextRightOffset `| Right offset for the description label in the ad cells|
|`avoCoverMediaLeftOffset `| Left offset for the ad main media view|
|`avoCoverMediaRightOffset `| Right offset for the ad main media view|
|`avoCoverMediaTopOffset `| Top offset for the ad main media view|
|`avoCoverMediaBottomOffset `| Bottom offset for the ad main media view|
|`avoCoverMediaCornerRadius `| Corner radius of the ad main media layer|
|`avoCoverMediaAutoPlayEnabled `| Enabling of video autoplay for main media view|
|`avoCTAFont `| Call to action label font |
|`avoCTAColor `| Call to action view background color|
|`avoCTATextColor `| Call to action label text color|
|`avoCTABorderColor `| Call to action layer border color|
|`avoCTACornerRadius `| Call to action layer corner radius |
|`avoCTABorderWidth `| Call to action layer border width|
|`avoCTARightOffset `| Right offset for ad call to action view|
|`avoCTABottomOffset `| Bottom offset for ad call to action view|
|`avoCTATextStyle `| Text style for the call to action label in the ad cells (could be uppercase, lowercase, capitalize and default)|
|`avoSponsoredFont `| Sponsored label font|
|`avoSponsoredColor `| Sponsored label text color|
|`avoSponsoredTextStyle `| Text style for the sponsored label in the ad cells (could be uppercase, lowercase, capitalize and default)|
|`avoIconLeftOffset `| Left offset for ad app icon view|
|`avoIconTopOffset `| Top offset for ad app icon view|
|`avoIconHeight `| Height for ad app icon view|
|`avoIconWidth `| Width for ad app icon view|
|`avoIconCornerRadius `| Corner radius of ad app icon layer|
|`avoIconContentMode `| Content mode of ad app icon view|
|`avoMediaContentRatio `| Content ratio for the ad main media view (grid template)|
|`avoTextContentRatio `| Content ratio for the ad description (grid template)|
|`avoGridIconTemplateTitleIconBottomOffest `| Bottom offset for the title label (grid icon template)|
|`avoGridIconTemplateIconCTATopOffset `| Top offset for the call to action label (grid icon template)|

Other
=====


### Test mode (development mode)

During the development phase, it is highly recommended to set testMode to `YES` to work with test ads only. The default setting is `NO`.

```objective-c
#import <AvocarrotCore/Avocarrot.h>
...
AvocarrotSDK.testMode = YES;
```


### User data

To include user data in the SDK, please set up the following properties:

```objective-c
#import <AvocarrotCore/Avocarrot.h>
...
+ (void)setBirthday:(NSDate *_Nonnull)birthday;

+ (void)setGender:(AVOUserGender)userGender;

+ (void)setInterests:(NSArray<NSString *> *_Nonnull)interests;
```


For example:

```objective-c
#import <AvocarrotCore/Avocarrot.h>
...
[AvocarrotSDK setGender:AVOUserGenderMale];
[AvocarrotSDK setBirthday:[NSDate date]];
[AvocarrotSDK setInterests:@[@"running", @"shopping", @"fitness", @"sport"]];
```
