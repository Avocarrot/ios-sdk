//
//  AppDelegate.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotCore
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AvocarrotSDK.testMode = true
        setupCrashlytics()
        return true
    }
    
    func setupCrashlytics() {
        Fabric.with([Crashlytics.self])
    }
}
