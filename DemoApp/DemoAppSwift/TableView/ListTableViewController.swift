//
//  ListTableViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import Foundation
import AvocarrotNativeView

@objc(ListTableViewController)
class ListTableViewController: TableViewStreamController {
    
    fileprivate
    var adCellHeight: Int = 0 // 105

    override func viewDidLoad() {
        super.viewDidLoad()
        // If adCellHeight = 0, ad cell height will be calculated on the base of predefined size,
        // otherwise you can set desired height value
        loadAds()
    }

    fileprivate func loadAds() {
        var sizeDelegate: AVOTableViewStreamAdapterDelegate?
        
        if adCellHeight > 0 {
            sizeDelegate = self
        }
        
        AvocarrotSDK.shared.createStreamAdapter(for: tableView,
            parentViewController: self,
            adUnitId: adUnitId,
            templateType: .list,
            delegate: sizeDelegate,
            templateCustomization: {
                templateCustomizationObject in
                templateCustomizationObject.avoCTABorderWidth = 1
                templateCustomizationObject.avoCTACornerRadius = 5
            },
            success: nil,
            failure: { (error) in
                print("Stream adapter creating error: \(error.avo_errorDescription) with code: \(error.code)")
            })
    }
}

extension ListTableViewController: AVOTableViewStreamAdapterDelegate {
    // * Optional protocol
    // If you create an AVOTableViewStreamAdapterDelegate instance on the base of predefined ad templates then support of an AVOTableViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
    
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: Int(self.tableView.frame.size.width), height: adCellHeight)
    }
}
