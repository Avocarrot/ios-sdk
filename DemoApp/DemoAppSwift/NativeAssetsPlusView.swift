//
//  NativeAssetsPlusView.swift
//  DemoApp
//
//  Created by Glispa GmbH on 27/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeAssets
import SDWebImage

class NativeAssetsPlusView: UIView {

    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var callToActionTextLabel: UILabel!
    @IBOutlet weak var privacyInfoContainerView: UIImageView!

    func fill(withNativeAd nativeAssets: AVONativeAssets?) {
        mainTextLabel.text = nativeAssets?.text
        titleTextLabel.text = nativeAssets?.title

        if let iconURL = nativeAssets?.iconURL {
            iconImageView.sd_setImage(with: URL(string: iconURL))
        }

        if let imageURL = nativeAssets?.imageURL {
            mainImageView.sd_setImage(with: URL(string: imageURL))
        }
        
        if let adChoicesURL = nativeAssets?.adChoices?.iconUrl{
            privacyInfoContainerView.sd_setImage(with: URL(string: adChoicesURL))
        }

        callToActionTextLabel.text = nativeAssets?.callToActionTitle
    }

    func clickableSubViews() -> [UIView]? {
        return [titleTextLabel, iconImageView, mainImageView, callToActionTextLabel]
    }

    static func loadFromNib() -> NativeAssetsPlusView? {
        let className = String(describing: NativeAssetsPlusView.self)
        guard let nativeAdContainer = Bundle.main.loadNibNamed(className, owner: nil, options: nil)?.last as? NativeAssetsPlusView else {
            return nil
        }
        return nativeAdContainer
    }
}
