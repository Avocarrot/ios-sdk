//
//  MasterTableItem.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright ©  Glispa GmbH. All rights reserved.
//

import UIKit

struct MasterTableItem {
    let title: String
    let controller: String?
    let xibName: String?
    let childItems: [MasterTableItem]?
    let userData: [String:Any]?
    let image: String?
}

extension MasterTableItem {

    init(title: String, childItems: [MasterTableItem]?, image: String?) {
        self.init(title: title, controller: nil, xibName: nil, childItems: childItems, userData: nil, image: image)
    }

    init(title: String, controller: String?, xibName: String?, childItems: [MasterTableItem]?) {
        self.init(title: title, controller: controller, xibName: xibName, childItems: childItems, userData: nil, image: nil)
    }

    init(title: String, controller: String?, xibName: String?, childItems: [MasterTableItem]?, userData: [String:Any]?) {
        self.init(title: title, controller: controller, xibName: xibName, childItems: childItems, userData: userData, image: nil)
    }
}
