//
//  VideoDetailViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotVideo

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!

    public var adUnitId: String!

    private var video: AVOVideo?

    override func viewDidLoad() {
        super.viewDidLoad()
        showButton.isEnabled = false
    }

    // MARK: - Actions

    @IBAction func loadClicked(_ sender: UIButton) {
        showButton.isEnabled = false
        AvocarrotSDK.shared.loadVideo(withAdUnitId: adUnitId, success: { [weak self] (video) in
                                            guard let sSelf = self else {return}
                                            sSelf.video = video
                                            sSelf.showButton.isEnabled = true
                                            print("Video has loaded!")
                                        }, failure: { (error) in
                                            print("Video loading error: \(error.localizedDescription)")
                                        })
    }

    @IBAction func showClicked(_ sender: UIButton) {
        self.video?.show(from: self)
        showButton.isEnabled = false
    }

    @IBAction func loadAndShowClicked(_ sender: UIButton) {
        showButton.isEnabled = false
        AvocarrotSDK.shared.loadVideo(withAdUnitId: adUnitId, success: { [weak self] (video) in
                                        guard let sSelf = self else {return}
                                        sSelf.video = video
                                        video.show(from: sSelf)
                                        print("Video has loaded! And it will be shown...")
                                    }, failure: { (error) in
                                        print("Video loading error: \(error.localizedDescription)")
                                    })
    }

}

extension VideoDetailViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }
    }
}
