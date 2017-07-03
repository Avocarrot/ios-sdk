//
//  NativeAdDemonstratorViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import DZNSegmentedControl
import AvocarrotNativeView

class NativeAdDemonstratorViewController: UIViewController {
    @IBOutlet weak var segmentControl: DZNSegmentedControl!
    @IBOutlet weak var containerView: UIView!

    public var items: [MasterTableItem]?
    public var adUnitId: String!

    private var activeVC: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateDemonstrationView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var rect = segmentControl.frame
        rect.size.width = self.view.frame.size.width
        segmentControl.frame = rect
    }

    // MARK: - Action

    @IBAction func didChangeValue(_ sender: Any) {
        updateDemonstrationView()
    }

    // MARK: - Private
    private func setupUI() {
        setupSegmentControl()
    }

    fileprivate func setupSegmentControl() {
        segmentControl.items = items?.map { (item)  in
            return item.title
        }
        segmentControl.showsCount = false
        segmentControl.autoAdjustSelectionIndicatorWidth = false
        segmentControl.height = 30
        segmentControl.delegate = self
        segmentControl.hairlineColor = UIColor.clear
        segmentControl.tintColor = UIColor.white
        segmentControl.setTitleColor(UIColor(red: 0.8,
                                             green: 0.8,
                                             blue: 0.8,
                                             alpha: 0.9), for: .normal)
    }

    fileprivate func updateDemonstrationView() {
        guard let item = items?[segmentControl.selectedSegmentIndex] else { return }
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController: UIViewController? = nil
        if let xibName = item.xibName, let controllerName = item.controller {
            let viewControllerClass = NSClassFromString(controllerName) as! UIViewController.Type
            viewController = viewControllerClass.init(nibName: xibName, bundle: Bundle.main)
        } else if let controllerName = item.controller {
            viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        } else if let items = item.childItems {
            let nativeController = storyboard.instantiateViewController(withIdentifier: "NativeAdDemonstratorViewController") as! NativeAdDemonstratorViewController
            nativeController.items = items
            nativeController.title = item.title
            viewController = nativeController
        }

        if let managedController = viewController as? AppControllerManagement,
            let userData = item.userData {
            managedController.applyUserData(userData)
        }

        guard let contentVC = viewController else {return}
        displayContentController(content: contentVC)
    }

    fileprivate func displayContentController(content: UIViewController) {
        self.addChildViewController(content)
        content.view.frame = self.containerView.bounds
        self.containerView.addSubview(content.view)
        content.didMove(toParentViewController: self)

        activeVC?.view.removeFromSuperview()
        activeVC?.removeFromParentViewController()
        activeVC = content
    }

}

extension NativeAdDemonstratorViewController {
    fileprivate func supportedPresentations(forTemplate template: AVONativeAdsTemplateType) -> [MasterTableItem] {
        switch template {
        case .list:
            return [
                MasterTableItem(title: "CollectionView", controller: "ListCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
                MasterTableItem(title: "TableView", controller: "ListTableViewController", xibName: "BaseTableViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
                MasterTableItem(title: "Single Native", controller: "ListNativeAdDetailsViewController", xibName: "BaseNativeAdDetailsViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID])
                    ]
        case .feed:
            return [
                MasterTableItem(title: "CollectionView", controller: "FeedCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
                MasterTableItem(title: "TableView", controller: "FeedTableViewController", xibName: "BaseTableViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
                MasterTableItem(title: "Single Native", controller: "FeedNativeAdDetailsViewController", xibName: "BaseNativeAdDetailsViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID])
                   ]
        case .grid:
            return [
                MasterTableItem(title: "CollectionView", controller: "GridCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
                MasterTableItem(title: "Single Native", controller: "GridNativeAdDetailsViewController", xibName: "BaseNativeAdDetailsViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID])
                   ]
        default:
            return []
        }
    }

    fileprivate func supportedPresentationsForCustomisation() -> [MasterTableItem] {
        return [
            MasterTableItem(title: "Native Assets", controller: "NativeAssetsDetailsViewController", xibName: nil, childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]),
            MasterTableItem(title: "Custom Layout", controller: "CustomLayoutNativeAdDetailsViewController", xibName: "BaseNativeAdDetailsViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID])
                ]
    }
}

extension NativeAdDemonstratorViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let bannerId = userData["adUnitId"] as? String {
            adUnitId = bannerId
        }

        if let template = userData["template"] as? AVONativeAdsTemplateType {
            items = supportedPresentations(forTemplate: template)
        } else {
            items = supportedPresentationsForCustomisation()
        }
    }
}

extension NativeAdDemonstratorViewController: DZNSegmentedControlDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .bottom
    }
}
