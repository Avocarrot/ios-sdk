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
        loadBanner()
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
        AvocarrotSDK.shared.loadBanner(with: bannerSize, adUnitId: adUnitId,
                                       success: {[weak self] (bannerAd) in
                                            self?.addBannerOnScreen(newBanner: bannerAd)
                                        },
                                       failure: { (error) in
                                            print("Banner loading error: \(error.localizedDescription)")
                                       })
    }

    // MARK: - Actions

    @IBAction func autoupdateSwitched(_ sender: UISwitch) {
        bannerView?.autoUpdate = sender.isOn
    }
    
    // MARK: - Private
    private func addBannerOnScreen(newBanner: AVOBannerView) {
        bannerView?.stop()
        bannerView?.removeFromSuperview()
        bannerView = newBanner
        
        view.addSubview(newBanner)
        newBanner.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:[bannerView(\(newBanner.frame.size.height))]-20-|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["bannerView": newBanner]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "H:[bannerView(\(newBanner.frame.size.width))]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["bannerView": newBanner]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:[superview]-(<=1)-[bannerView]",
                                                           options: .alignAllCenterX,
                                                           metrics: nil,
                                                           views: ["bannerView": newBanner,
                                                                   "superview": view]))

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
    }
}
