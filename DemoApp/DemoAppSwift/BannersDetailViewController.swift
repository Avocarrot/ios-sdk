//
//  BannersDetailViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotBanner

class BannersDetailViewController: UIViewController {

    @IBOutlet weak var autoupdateSwitch: UISwitch!

    fileprivate var bannerView: AVOBannerView?

    public var bannerSize: AVOBannerViewSize!
    public var adUnitId: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bannerView?.resumeAutoUpdate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bannerView?.pauseAutoUpdate()
    }

    // MARK: - Public

    public func loadBanner() {
        bannerView?.stop()
        bannerView?.removeFromSuperview()
        bannerView = nil

        bannerView = AvocarrotSDK.shared.loadBanner(with: bannerSize, adUnitId: adUnitId, success: { (bannerAd) in
                                                        print("Banner has loaded!")
                                                    }, failure: { (error) in
                                                        print("Banner loading error: \(error.localizedDescription)")
                                                    })

        guard let bv = bannerView else {
            return
        }

        view.addSubview(bv)
        bv.translatesAutoresizingMaskIntoConstraints = false

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:[bannerView(\(bv.frame.size.height))]-20-|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["bannerView": bv]))

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "H:[bannerView(\(bv.frame.size.width))]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["bannerView": bv]))

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:[superview]-(<=1)-[bannerView]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["bannerView": bv,
                    "superview": view]))

    }

    // MARK: - Actions

    @IBAction func autoupdateSwitched(_ sender: UISwitch) {
        bannerView?.autoUpdate = sender.isOn
    }
}

extension BannersDetailViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let type = userData["bannerType"] as? AVOBannerViewSize {
            bannerSize = type
        }

        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }

        loadBanner()
    }
}
