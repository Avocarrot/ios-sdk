//
//  FeedCollectionViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import Foundation
import AvocarrotNativeView

@objc(FeedCollectionViewController)
class FeedCollectionViewController: BaseFlowLayoutCollectionViewController {
    fileprivate
    var adapter: AVOCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = loadData(20, from: 0)
        loadAds()
    }

    func loadAds() {

        adapter = AvocarrotSDK.shared.createStreamAdapter(for: collectionView,
                parentViewController: self,
                adUnitId: adUnitId,
                templateType: .feed,
                delegate: self,
                templateCustomization: nil)
        adapter?.shiftOffsetBackOnAdInsert = false
    }
}

extension FeedCollectionViewController: AVOCollectionViewStreamAdapterDelegate {
    // * Optional protocol
    // If you create an AVOCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAVOCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
    
    func sizeForAd(at indexPath: IndexPath?) -> CGSize {
        return CGSize(width: Int(collectionView.frame.size.width - 2), height: 320)
    }
}
