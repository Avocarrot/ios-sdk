//
//  ServerTemplateCollectionViewController.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 10.08.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

@objc(ServerTemplateCollectionViewController)
class ServerTemplateCollectionViewController: BaseFlowLayoutCollectionViewController {
    
    // You should set value of ad cell height for server template. Just try different values.
    fileprivate
    var adCellHeight: Int = 320
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(24)
        loadAds()
    }
    
    func loadAds() {
        
        AvocarrotSDK.shared.createStreamAdapter(for: collectionView,
            parentViewController: self,
            adUnitId: adUnitId,
            templateType: .server,
            delegate: self,
            templateCustomization: nil,
            success: { (adapter) in
            },
            failure: { (error) in
                print("Stream adapter creating error: \(error.avo_errorDescription) with code: \(error.code)")
            })
    }
}

extension ServerTemplateCollectionViewController: AVOCollectionViewStreamAdapterDelegate {
    // Avocarrot SDK knows nothing about optimal size for server template, so you should return desired value.
    
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: Int(collectionView.frame.size.width - 2), height: adCellHeight)
    }
}

