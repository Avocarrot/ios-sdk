//
//  BaseCollectionViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 12.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

import UIKit
import AvocarrotNativeView

class BaseCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    public var adUnitId: String!
}

extension BaseCollectionViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }
    }
}
