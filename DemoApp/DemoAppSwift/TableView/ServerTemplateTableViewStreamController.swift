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
    var adapter: AVOTableViewStreamAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAds()
    }
    
    fileprivate func loadAds() {
        
        adapter = AvocarrotSDK.shared.createStreamAdapter(for: tableView,
                                                          parentViewController: self,
                                                          adUnitId: adUnitId,
                                                          templateType: .server,
                                                          templateCustomization: {
                                                            templateCustomizationObject in
                                                            templateCustomizationObject.avoCTABorderWidth = 1
                                                            templateCustomizationObject.avoCTACornerRadius = 5
        })
    }

}
