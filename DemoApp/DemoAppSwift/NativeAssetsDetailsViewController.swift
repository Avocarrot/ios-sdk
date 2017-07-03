//
//  NativeAssetsDetailsViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeAssets

class NativeAssetsDetailsViewController: UIViewController {

    @IBOutlet weak var adContainerView: UIView!

    @IBOutlet weak var nativeContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nativeContainerTopConstraint: NSLayoutConstraint!

    public var adUnitId: String!
    fileprivate var nativeView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func loadAds() {
        nativeView?.removeFromSuperview()

        AvocarrotSDK.shared.loadNativeAd(withAdUnitId: adUnitId, success: { [weak self] (
                nativeAd) in
            guard let sSelf = self,
                  let nativeView = sSelf.getNativeAdContainer(forNativeAd: nativeAd) else {
                return nil
            }

            let clickableSubviews = nativeView.clickableSubViews()

            sSelf.nativeView?.removeFromSuperview()
            sSelf.nativeView = nativeView

            sSelf.renderBannerAd()

            nativeAd.onClick({
                print("Native Assets! Clicked")
            }).onImpression({
                print("Native Assets! Impressed")
            }).onLeftApplication({
                print("Native Assets! Left application")
            }).registerView(forInteraction: nativeView, forClickableSubviews: clickableSubviews)
              .registerAdChoicesView(nativeView.privacyInfoContainerView)

            return nativeView
        }, failure: { error in
            print("Native Assets error: \(error.localizedDescription)")
        })
    }

    // MARK: - Private

    fileprivate func getNativeAdContainer(forNativeAd ad: AVONativeAssets?) -> NativeAssetsPlusView? {
        let nativeAdContainer = NativeAssetsPlusView.loadFromNib()
        nativeAdContainer?.fill(withNativeAd: ad)
        return nativeAdContainer
    }

    fileprivate func renderBannerAd() {
        if nativeView?.superview == nil {
            nativeContainerHeightConstraint.constant = 300
            adContainerView.layoutIfNeeded()

            nativeView!.frame = self.adContainerView.bounds
            nativeView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            adContainerView.addSubview(self.nativeView!)
            adContainerView.layoutIfNeeded()

            showBannerWithAnimation(true)
        }
    }

    fileprivate func showBannerWithAnimation(_ animated: Bool) {
        nativeContainerTopConstraint.constant = -self.nativeContainerHeightConstraint.constant
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            self.view.layoutIfNeeded()
        }
    }

}

extension NativeAssetsDetailsViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let bannerId = userData["adUnitId"] as? String {
            adUnitId = bannerId
        }

        loadAds()
    }
}
