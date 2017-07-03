//
//  BaseNativeAdDetailsViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

class BaseNativeAdDetailsViewController: UIViewController {

    @IBOutlet weak var adContainerView: UIView!

    public var adUnitId: String!

    @IBOutlet weak var nativeContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nativeContainerTopConstraint: NSLayoutConstraint!

    var desiredHeight: CGFloat = 0

    private var nativeView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func loadAds() {
        nativeView?.removeFromSuperview()
        prepareHeight()
    }

    func prepareHeight() {
        desiredHeight = 0
    }

    func displayAd(withAdView adView: UIView) {
        nativeView = adView
        if nativeView?.superview == nil {
            nativeView!.translatesAutoresizingMaskIntoConstraints = true
            nativeContainerHeightConstraint.constant = desiredHeight
            adContainerView.layoutIfNeeded()
            nativeView!.frame = adContainerView.bounds
            nativeView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            adContainerView.addSubview(nativeView!)
            adContainerView.layoutIfNeeded()
            showBannerWithAnimation(true)
        }
    }

    // MARK: - Private

    private func showBannerWithAnimation(_ animated: Bool) {
        nativeContainerTopConstraint.constant = -nativeContainerHeightConstraint.constant
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            view.layoutIfNeeded()
        }
    }
}

extension BaseNativeAdDetailsViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }

        loadAds()
    }
}
