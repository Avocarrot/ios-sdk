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
class CustomTemplateTableViewController: BaseTableViewController {

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
                adViewClassForRendering: NativeBannerView.self)
    }
}
