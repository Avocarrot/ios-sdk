//
//  ServerTemplateTableViewStreamController.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

@objc(ServerTemplateTableViewStreamController)
class ServerTemplateTableViewStreamController: TableViewStreamController {
    
    fileprivate
    // You should set value of ad cell height for server template. Just try different values.
    var adCellHeight: Int = 320
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAds()
    }
    
    fileprivate func loadAds() {
        
        AvocarrotSDK.shared.createStreamAdapter(for: tableView,
            parentViewController: self,
            adUnitId: adUnitId,
            templateType: .server,
            delegate: self,
            templateCustomization: { templateCustomizationObject in
                templateCustomizationObject.avoCTABorderWidth = 1
                templateCustomizationObject.avoCTACornerRadius = 5
            },
            success: nil,
            failure: { (error) in
                print("Stream adapter creating error: \(error.avo_errorDescription) with code: \(error.code)")
            })
    }

}

extension ServerTemplateTableViewStreamController: AVOTableViewStreamAdapterDelegate {
    // * Optional protocol
    // If you create an AVOTableViewStreamAdapterDelegate instance on the base of predefined ad templates then support of an AVOTableViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
    
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: Int(self.tableView.frame.size.width), height: adCellHeight)
    }
}
