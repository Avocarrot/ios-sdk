//
//  CustomTemplateTableViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import Foundation
import AvocarrotNativeView

@objc(CustomTemplateTableViewController)
class CustomTemplateTableViewController: TableViewStreamController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAds()
    }

    fileprivate func loadAds() {

        AvocarrotSDK.shared.createStreamAdapter(for: tableView,
            parentViewController: self,
            adUnitId: adUnitId,
            delegate: self,
            adViewClassForRendering: NativeBannerView.self,
            success: nil,
            failure: { (error) in
                print("Stream adapter creating error: \(error.avo_errorDescription) with code: \(error.code)")
            })
    }
}

extension CustomTemplateTableViewController: AVOTableViewStreamAdapterDelegate {
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: self.tableView.frame.size.width, height: NativeBannerView.desiredHeight())
    }
}
