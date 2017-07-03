//
//  CustomLayoutNativeAdDetailsViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 09.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

@objc(CustomLayoutNativeAdDetailsViewController)
class CustomLayoutNativeAdDetailsViewController: BaseNativeAdDetailsViewController {

    override func loadAds() {
        super.loadAds()

        AvocarrotSDK.shared.loadNativeAd(withAdUnitId: adUnitId,
                                      parentViewController: self,
                                      adViewClassForRendering: NativeBannerView.classForCoder(),
                                      success: { [weak self] (view) in
                                        guard let sSelf = self else {return}
                                        sSelf.displayAd(withAdView: view)
                                        print("Native ad has loaded!")
                                      }, failure: { (error) in
                                        print("Native ad error: \(error.localizedDescription)")
                                      })
    }

    override func prepareHeight() {
        desiredHeight = NativeBannerView.desiredHeight()
    }

}
