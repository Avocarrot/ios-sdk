Manual Avocarrot SDK integration guide
=================

From version 4.5 Avocarrot SDK uses modular system for distribution, the complete package contains these frameworks:

| Framework | Description |
|:----------------|:----------------|
|`AvocarrotCore.framework`| Core functionality; provides access to main SDK settings |
|`AvocarrotBanner.framework`| Provides access to banner ads |
|`AvocarrotInterstitial.framework`| Provides access to interstitial ads |
|`AvocarrotVideo.framework`| Provides access to video ads |
|`AvocarrotNativeAssets.framework`| Provides access to raw native data |
|`AvocarrotNativeView.framework`| Provides access to rendered native ads |
|`Vast.framework`| Implementation of [VAST](https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-3-0/) |
|`Mraid.framework`| Implementation of [MRAID](https://www.iab.com/guidelines/mobile-rich-media-ad-interface-definitions-mraid/) |

### **1.** Add SDK files to your project (required)

Required frameworks for each ad type:

| Ad type | Frameworks |
|:----------------|:----------------|
| Banners | `AvocarrotCore.framework`, `AvocarrotBanner.framework`, `Mraid.framework` |
| Interstitial | `AvocarrotCore.framework`, `AvocarrotInterstitial.framework`, `Mraid.framework` |
| Video | `AvocarrotCore.framework`, `AvocarrotVideo.framework`, `Vast.framework` |
| Native assets | `AvocarrotCore.framework`, `AvocarrotNativeAssets.framework` |
| Native view (rendered native ad) |  `AvocarrotCore.framework`, `AvocarrotNativeAssets.framework`,  `AvocarrotNativeView.framework`, `Vast.framework` |

Add needed files to your project.

### **2.** Add external libraries (recommended)

To show **standard** banner ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [Baidu](http://mssp.baidu.com/home/developer.html) library
* [Tencent](http://dev.e.qq.com/) library
* [InLoco](https://github.com/In-Loco-Media/inlocomedia-ios-sdk) library

To show **interstitial** ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library and
* [Chartboost](http://cboo.st/ios_v6-3) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) library
* [AppLovin](https://www.applovin.com/) library
* [Baidu](http://mssp.baidu.com/home/developer.html) library
* [Tencent](http://dev.e.qq.com/) library
* [InLoco](https://github.com/In-Loco-Media/inlocomedia-ios-sdk) library

To show **video** ads from client-side mediated networks in your application you need to add:

* [Unity Ads](https://github.com/Applifier/unity-ads-sdk) library
* [Chartboost](http://cboo.st/ios_v6-3) library
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) library
* [Vungle](https://v.vungle.com/sdk) library

To show **native** ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [AppLovin](https://www.applovin.com/) library
* [Baidu](http://mssp.baidu.com/home/developer.html) library
* [Tencent](http://dev.e.qq.com/) library
* [InLoco](https://github.com/In-Loco-Media/inlocomedia-ios-sdk) library

**Warning: Avocarrot SDK 4.5.0 was designed and verified to work correctly with the following versions of 3rd party ad network SDKs:**

* Chartboost – 6.6.3
* Google Mobile Ads – 7.20.0
* NativeX – 5.5.9
* Unity Ads – 2.1.0
* Vungle – 4.1.0
* Facebook Audience – 4.20.2
* MoPub – 4.14.0
* AppLovin – 3.1
* Baidu - 4.5
* Tencent - 4.5.4
* InLoco - 2.4.4

We do not guarantee stable and correct behaviour of the Avocarrot SDK if you manually add other versions of ad network SDKs.

### **3.** Add SDK external adapters to your project
For each added external ad network from the section above you should add the SDK adapter for this network for each ad type from the Adapters folder. Just add the necessary adapters to the project.

*Chartboost*:

| Ad type | Adapters |
|:----------------|:----------------|
| Interstitial | `libAVOChartboostAdapter-Core.a`, `libAVOChartboostAdapter-Interstitial.a` |
| Video | `libAVOChartboostAdapter-Core.a`, `libAVOChartboostAdapter-Video.a` |

*Google Mobile Ads*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOGoogleMobileAdsAdapter-Core.a `, `libAVOGoogleMobileAdsAdapter-Banner.a` |
| Interstitial | `libAVOGoogleMobileAdsAdapter-Core.a `, `libAVOGoogleMobileAdsAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOGoogleMobileAdsAdapter-Core.a `, `libAVOGoogleMobileAdsAdapter-Native.a` |

*NativeX*:

| Ad type | Adapters |
|:----------------|:----------------|
| Interstitial | `libAVONativeXAdapter-Core.a `, `libAVONativeXAdapter-Interstitial.a` |
| Video | `libAVONativeXAdapter-Core.a `, `libAVONativeXAdapter-Video.a` |

*Unity Ads*:

| Ad type | Adapters |
|:----------------|:----------------|
| Video | `libAVOUnityAdsAdapter-Video.a` |

*Vungle*:

| Ad type | Adapters |
|:----------------|:----------------|
| Video | `libAVOVungleAdapter-Video.a` |

*Facebook Audience*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOFBAudienceAdapter-Core.a`, `libAVOFBAudienceAdapter-Banner.a` |
| Interstitial | `libAVOFBAudienceAdapter-Core.a`, `libAVOFBAudienceAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOFBAudienceAdapter-Core.a`, `libAVOFBAudienceAdapter-Native.a` |

*MoPub*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOMopubAdapter-Core.a`, `libAVOMopubAdapter-Banner.a` |
| Interstitial | `libAVOMopubAdapter-Core.a`, `libAVOMopubAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOMopubAdapter-Core.a`, `libAVOMopubAdapter-Native.a` |

*AppLovin*:

| Ad type | Adapters |
|:----------------|:----------------|
| Interstitial | `libAVOAppLovinAdapter-Core.a`, `libAVOAppLovinAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOAppLovinAdapter-Core.a`, `libAVOAppLovinAdapter-Native.a` |

*Baidu*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOBaiduAdapter-Core.a`, `libAVOBaiduAdapter-Banner.a` |
| Interstitial | `libAVOBaiduAdapter-Core.a`, `libAVOBaiduAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOBaiduAdapter-Core.a`, `libAVOBaiduAdapter-Native.a` |

*Tencent*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOTencentAdapter-Banner.a` |
| Interstitial | `libAVOTencentAdapter-Interstitial.a` |
| Native view (rendered native ad) | `libAVOTencentAdapter-Native.a` |

*InLoco*:

| Ad type | Adapters |
|:----------------|:----------------|
| Banners | `libAVOInLocoAdapter-Core.a`, `libAVOInLocoAdapter-Banner.a` |
| Interstitial | `libAVOInLocoAdapter-Core.a`, `libAVOInLocoAdapter-Interstitial.a` |
| Native view (rendered native ad) |  `libAVOInLocoAdapter-Core.a`, `libAVOInLocoAdapter-Native.a` |


### **4.** Set up external networks
You should set up each added external network on the Avocarrot dashboard, otherwise they will not be used for showing ads.

### **5.** Add `-ObjC` flag to project settings (Other Linker Flags property)

**Note: If your app can't use `-ObjC` flag just add `-force_load $(PROJECT_DIR)/Pods/avocarrot-ios-sdk/AvocarrotSDK.framework/Versions/Current/AvocarrotSDK` flag to Other Linker Flags**

### **6.** Required system libraries for all libs
The SDK with adapters uses the following system frameworks and libraries. You can set flag "Link Frameworks automatically" to `YES` otherwise you should add following system frameworks and libraries to your project manually:

- `WebKit`
- `Security`
- `QuickLook`
- `MobileCoreServices`
- `CoreText`
- `AssetsLibrary`
- `Foundation`
- `CoreData`
- `Social`
- `MessageUI`
- `MediaPlayer`
- `EventKit`
- `EventKitUI`
- `QuartzCore`
- `CoreMedia`
- `CFNetwork`
- `SystemConfiguration`
- `CoreGraphics`
- `StoreKit`
- `CoreTelephony`
- `AVFoundation`
- `AdSupport`
- `AudioToolbox`
- `UIKit`
- `libxml2`
- `libsqlite3`
- `libz`
