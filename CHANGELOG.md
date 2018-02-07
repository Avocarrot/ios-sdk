# Change Log
All notable changes to this project will be documented in this file.
# [4.9.0]
### Removed
- Mediation support for all networks

# [4.8.0]
### Added
- VPAID support for fullscreen video ad
- Debug logs and errors description forwarding to developer side

### Changed
- SDK public API to conform to "void api"

### Removed
- Support of AdColony, NativeX, Tencent and Baidu networks mediation

# [4.7.4]
### Fixed
- WKWebKit loading problem issue

# [4.7.3]
### Fixed
- Global functions renamed to avoid potential conflicts

# [4.7.2]
### Fixed
- SDK performance optimization
- Cocoapods podspec dependencies

# [4.7.1]
### Added
- Notifications in logs to update SDK to new version

### Fixed
- HTML banners autoupdate logic

# [4.7.0]
### Added
- Delegate for UITableView StreamAdapter

### Changed
- Support of MRAID 3.0
- UIWebView has been replaced with WKWebView in MRAID and VAST modules
- Analytics for better ad targeting splitted on 2 modules: base and advanced

### Fixed
- Locale data processing crash

# [4.6.2]
### Fixed
- Native Assets, MoPub and Admob adapters for mediation

# [4.6.1]
### Fixed
- iOS 11 status bar crash

# [4.6.0]
### Added
- Added Native Assets support for: Facebook Audience SDK, Google Mobile Ads SDK, InLocoMedia Ads SDK, Applovin Ads SDK, Tencent Ads SDK
- Added 300x250 banner size supporting
- Added dynamic template for native ads

# [4.5.2]
### Fixed
- birthday format for user information

# [4.5.1]
### Fixed
- adDidHide event for Video ads

# [4.5.0]
### Added
- AdChoices click handling for Native Assets
- Test mode for Avocarrot ads

### Changed
- Ampiri platform merged with Avocarrot
- SDK split on modules
- New Demo application
- Facebook Audience SDK updated to 4.23.3
- Google Mobile Ads SDK updated to 7.21.0
- MoPub SDK updated to 4.15.0

# [4.2.1]
### Fixed
- Banner deallocation process

# [4.2.0]
### Added
- *Grid* and *Grid Icon* templates for the native ad type
- Ability to use templates in single native ads
- Additional native templates customizations

### Changed
- Chartboost SDK updated to 6.6.3
- Google Mobile Ads SDK updated to 7.20.0
- Vungle SDK updated to 4.1.0
- MoPub SDK updated to 4.14.0

# [4.1.1]
### Added
-  Added flag for shifting UICollectionView offset back to the original position after inserting ads while using AMPStreamAdapter

# [4.1.0]
### Changed
- InLocoMedia Ads SDK updated to 2.4.4
- Google Mobile Ads SDK updated to 7.19.1

### Added
- Ad events sending retry policy
- Video completed event added for native video

### Fixed
- Impression tracking calculation
- Displaying internal browser for ad content

## [4.0.0]
### Added
- Swift friendly event callbacks fluent API for all ad types

### Changed
- `AmpiriSDK.sharedSDK` is transformed to class property
- `AmpiriSDK` facade is split to files according to ad type
- Changed method signature for `AMPBannerView` loading
- `AMPFullscreenBannerController` renamed to `AMPInterstitial`
- Changed method signature for `AMPInterstitial` loading
- `AMPVideoController` renamed to `AMPVideo`
- `AMPNativeAd` renamed to `AMPNativeAssets`
- `LocationControl` renamed to `StreamAdapter`
- Changed method signature for `StreamAdapter` loading
- `InFeed` and `ContentStream` templates renamed to `List` and `Feed` templates

## [3.9.1]
### Fixed
- crash during ad loading error handling
- crash during standard banner click processing

## [3.9.0]
### Added
- Custom native ads support
- Mopub mediation adapter

### Changed
- AdColony SDK updated to 3.1.0
- Chartboost SDK updated to 6.6.2
- Google Mobile Ads SDK updated to 7.19.0
- NativeX SDK updated to 5.5.9
- Facebook Audience SDK updated to 4.20.2
- Mopub SDK updated to 4.12.0
- InLocoMedia Ads SDK updated to 2.4.2

## [3.8.0]
### Added
- bitcode support

### Changed
- Facebook Audience SDK updated to 4.19.0

### Fixed
- mediation timeouts

## [3.7.0]
### Added
- InLoco Ad Network 2.4.0 support

### Changed
- Google Mobile Ads SDK updated to 7.17.0
- Unity Ads SDK updated to 2.0.8

## [3.6.0]
### Added
- Tencent Ad Network support
- Baidu Ad Network banners and interstitials support
- Doubleclick ADX support
- ATS Settings support

### Changed
- Chartboost SDK updated to 6.6.1
- Unity Ads SDK updated to 2.0.6
- Banners impression tracking updated according to IAB requirements


## [3.5.0]
### Added
- Improved analytics for better ad targeting

### Changed
- Adcolony SDK updated to 3.0.6
- Chartboost SDK updated to 6.6.0
- Google Mobile Ads SDK updated to 7.16.0
- NativeX SDK updated to 5.5.7.1
- Facebook Audience SDK updated to 4.18.0
- Mopub SDK updated to 4.11.1
- Baidu SDK updated to 4.5.0

## [3.4.0]
### Added
- VAST native video support
- Mopub native video support
- Cache for location control
- Ad pool for frequent requests
- Added nullability of parameters in public API


### Fixed
- Memory usage in location control


## [3.3.4]
### Fixed
- Location control minor issues


## [3.3.0]
### Added
- Baidu Ad Network support
- VAST video support

### Changed
- Demo application updated to Swift 3.0
- Chartboost SDK updated to 6.5.1
- Google Mobile Ads SDK updated to 7.12.1
- Mopub SDK updated to 4.9.1
- Vungle SDK updated to 3.2.2
- Facebook Audience SDK updated to 4.16.0
- Baidu SDK updated to 4.3.1

### Fixed
- UI bugs in Location control templates


## [3.2.2]
### Added
- New simplified demo application
- Multiple ad anits support
- Cool down timeout for ad requests

### Changed
- AdColony SDK updated to 2.6.2
- Chartboost SDK updated to 6.4.6
- Google Mobile Ads SDK updated to 7.9.0
- Mopub SDK updated to 4.7.0
- `useDefaultGridMode` parameter removed from `UICollectionView` templated location control

### Fixed
- Location control various UI bugs
- Location control support for data source dynamic changes

## [3.2.1]
### Changed
- `adUnitId` is used instead of different names for identifying ad units across the test application, demo application and documentation
- Facebook Audience SDK updated to 4.14.0
- Google Mobile Ads SDK updated to 7.9.0

### Fixed
- Crash caused by Facebook Audience SDK
- Click was not registered for some Chartboost video ads
- Disappearance of Mopub ads in location control

## [3.2.0]
### Added
- Facebook media view support (Native video and Carousel ads)
- Location control ads preloading
- Internal web view for showing non-AppStore ads.
- Fixed size items for Location control in `UICollectionView`

### Changed
- iOS Deployment target set to 8.0
- AdColony SDK updated to 2.6.2
- Facebook Audience SDK updated to 4.13.1
- Vungle SDK updated to 3.2.1
- Chartboost SDK updated to 6.4.6
- Mopub SDK updated to 4.7.0
- Rating is hidden in ad if it’s 0

### Fixed
- Startapp interstitials click handling
- InMobi banners click handling
- Admob ads display in Feed
- Location control memory usage
- Location control impression issues
- Smooth scroll for location control


## [3.1.0]
### Added
- Feed ads support for ```UITableView``` and ```UICollectionView```
- Customizable templates for infeed ads
- Custom layout support for ```UICollectionView```
- Applovin ad network integration

### Changed
- Facebook Audience updated to 4.11.0
- Chartboost updated to 6.4.4
- Google Mobile Ads updated to 7.8.0
- Mopub updated to 4.6.1

### Fixed
- Server-side video loading
- All fields in native ad are clickable
- VAST video loading
- Chartboost video orientation bug
- Vungle and Chartboost click and videoCompleted requests



[3.1.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.1.0
[3.2.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.0
[3.2.1]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.1
[3.2.2]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.2
[3.3.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.0
[3.3.4]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.4
[3.4.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.4.0
[3.5.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.5.0
[3.6.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.6.0
[3.7.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.7.0
[3.8.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.8.0
[3.9.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.9.0
[3.9.1]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.9.1
[4.0.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v4.0.0
