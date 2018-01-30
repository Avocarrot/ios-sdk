//
//  UserSettings.swift
//  DemoApp
//
//  Created by Glispa GmbH on 14.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import Foundation

class UserSettings {
    static private let currentBannerAdUnitIdKey: String = "currentBannerAdUnitIdKey"
    static private let currentInterstitialAdUnitIdKey = "currentInterstitialAdUnitIdKey"
    static private let currentVideoAdUnitIdKey = "currentVideoAdUnitIdKey"
    static private let currentNativeAdUnitIdKey = "currentNativeAdUnitIdKey"
    static private let currentNativeAssetsAdUnitIdKey = "currentNativeAssetsAdUnitIdKey"
    
    static var bannerAdUnitID: String {
        get {
            guard let adUnitId = UserDefaults.standard.object(forKey: currentBannerAdUnitIdKey) as? String
                else {return DefaultAdUnitId.bannerAdUnitID}
            return adUnitId
        }
        set(newId) {
            UserDefaults.standard.set(newId, forKey: currentBannerAdUnitIdKey)
        }
    }

    static var interstitialAdUnitID: String {
        get {
            guard let adUnitId = UserDefaults.standard.object(forKey: currentInterstitialAdUnitIdKey) as? String
                else {return DefaultAdUnitId.interstitialAdUnitID}
            return adUnitId
        }
        set(newId) {
            UserDefaults.standard.set(newId, forKey: currentInterstitialAdUnitIdKey)
        }
    }

    static var videoAdUnitID: String {
        get {
            guard let adUnitId = UserDefaults.standard.object(forKey: currentVideoAdUnitIdKey) as? String
                else {return DefaultAdUnitId.videoAdUnitID}
            return adUnitId
        }
        set(newId) {
            UserDefaults.standard.set(newId, forKey: currentVideoAdUnitIdKey)
        }
    }

    static var nativeAdUnitID: String {
        get {
            guard let adUnitId = UserDefaults.standard.object(forKey: currentNativeAdUnitIdKey) as? String
                else {return DefaultAdUnitId.nativeAdUnitID}
            return adUnitId
        }
        set(newId) {
            UserDefaults.standard.set(newId, forKey: currentNativeAdUnitIdKey)
        }
    }
    
    static var nativeAssetsAdUnitID: String {
        get {
            guard let adUnitId = UserDefaults.standard.object(forKey: currentNativeAssetsAdUnitIdKey) as? String
                else {return DefaultAdUnitId.nativeAssetsAdUnitID}
            return adUnitId
        }
        set(newId) {
            UserDefaults.standard.set(newId, forKey: currentNativeAssetsAdUnitIdKey)
        }
    }
}
