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

    fileprivate
    var adapter: AVOTableViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAds()
    }

    fileprivate func loadAds() {

        adapter = AvocarrotSDK.shared.createStreamAdapter(for: tableView,
                parentViewController: self,
                adUnitId: adUnitId,
                delegate: self,
                adViewClassForRendering: NativeBannerView.self)
    }
}

extension CustomTemplateTableViewController: AVOTableViewStreamAdapterDelegate {
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: self.tableView.frame.size.width, height: NativeBannerView.desiredHeight())
    }
}
