//
//  InterstitialsDetailViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotInterstitial

class InterstitialsDetailViewController: UIViewController {

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!
    @IBOutlet weak var loadAndShowWithDelayButton: UIButton!

    public var adUnitId: String!

    private var interstitial: AVOInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()
        showButton.isEnabled = false
    }

    // MARK: - Actions

    @IBAction func loadClicked(_ sender: UIButton) {
        showButton.isEnabled = false
        AvocarrotSDK.shared.loadInterstitial(withAdUnitId: adUnitId, success: { [weak self] (interstitial) in
                                            guard let sSelf = self else {return}
                                            sSelf.interstitial = interstitial
                                            sSelf.showButton.isEnabled = true
            
                                            interstitial.onClick{
                                                print("The intestitial is clicked")
                                            }
            
                                            print("Interstitial has loaded!")
                                           }, failure: { (error) in
                                            print("Interstitial loading error: \(error.localizedDescription)")
                                           })
    }

    @IBAction func showClicked(_ sender: UIButton) {
        interstitial?.show(from: self)
        showButton.isEnabled = false
    }

    @IBAction func loadAndShowClicked(_ sender: UIButton) {
        showButton.isEnabled = false
        AvocarrotSDK.shared.loadInterstitial(withAdUnitId: adUnitId,
                                              success: { [weak self] (interstitial) in
                                                guard let sSelf = self else {return}
                                                sSelf.interstitial = interstitial
                                                
                                                interstitial.onClick{
                                                    print("The intestitial is clicked")
                                                }
                                                
                                                interstitial.show(from: sSelf)
                                                print("Interstitial has loaded! And it will be shown...")
                                              }, failure: { (error) in
                                                print("Interstitial loading error: \(error.localizedDescription)")
                                              })

    }

}

extension InterstitialsDetailViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }
    }
}
