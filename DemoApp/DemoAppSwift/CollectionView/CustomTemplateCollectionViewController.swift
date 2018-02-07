//
//  CustomTemplateCollectionViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import Foundation
import AvocarrotNativeView

@objc(CustomTemplateCollectionViewController)
class CustomTemplateCollectionViewController: BaseFlowLayoutCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(20)
        loadAds()
    }


    func loadAds() {

        AvocarrotSDK.shared.createStreamAdapter(for: collectionView,
            parentViewController: self,
            adUnitId: adUnitId,
            delegate: self,
            adViewClassForRendering: NativeBannerView.self,
            success: { (adapter) in
            },
            failure: { (error) in
                print("Stream adapter creating error: \(error.avo_errorDescription) with code: \(error.code)")
            })
    }
}

extension CustomTemplateCollectionViewController: AVOCollectionViewStreamAdapterDelegate {
// * Optional protocol
// If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
    
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: Int(collectionView.frame.size.width - 2), height: Int(NativeBannerView.desiredHeight()))
    }
}
