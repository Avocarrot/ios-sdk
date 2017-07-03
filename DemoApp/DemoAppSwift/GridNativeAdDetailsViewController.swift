//
//  GridNativeAdDetailsViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 09.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

@objc(GridNativeAdDetailsViewController)
class GridNativeAdDetailsViewController: BaseNativeAdDetailsViewController {

    override func loadAds() {
        super.loadAds()

        AvocarrotSDK.shared.loadNativeAd(withAdUnitId: adUnitId,
                                      parentViewController: self,
                                      templateType: .grid,
                                      success: {  [weak self] (view) in
                                        guard let sSelf = self else {return}
                                        sSelf.displayAd(withAdView: view)
                                        print("Native ad has loaded!")
                                      }, failure: { error in
                                        print("Native ad error: \(error)")
                                      }, templateCustomization: nil)
    }

    override func prepareHeight() {
        desiredHeight = 300
    }

}
