//
//  MainViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on on 07.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import DZNSegmentedControl
import AvocarrotBanner
import AvocarrotNativeView

enum DZSegmentType: Int {
    case segmentBanner = 0
    case segmentInterstitial = 1
    case segmentVideo = 2
    case segmentNative = 3
}

class MainViewController: UIViewController {

    @IBOutlet weak var segmentControl: DZNSegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var adUnitTextField: UITextField!

    private var tableVC: MasterTableViewController? {
        return self.childViewControllers.first(where: {$0 is MasterTableViewController}) as? MasterTableViewController
    }

    open var items: [MasterTableItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateRelations()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = scrollView.contentSize
        let itemWidth = scrollView.frame.size.width
        scrollView.contentSize = CGSize(width: CGFloat(segmentControl.items.count) * itemWidth, height: size.height)
        var rect = segmentControl.frame
        rect.size.width = scrollView.frame.size.width
        segmentControl.frame = rect
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }

        switch identifier {
        case "createAdUnitIdSegue":
            let viewController = segue.destination as! CreateAdUnitIdViewController
            viewController.backgroundImage = self.view.takeSnapshot()
            break

        default:
            break
        }
    }

    // MARK: - Action

    @IBAction func didChangeValue(_ sender: Any) {
        updateRelations()
    }

    @IBAction func btnAddAdUnitTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let adUnitController = storyboard.instantiateViewController(withIdentifier: "CreateAdUnitIdViewController") as! CreateAdUnitIdViewController

        adUnitController.backBlock = {[unowned self](adUnitId, adType) in
            switch adType {
            case .banner:
                UserSettings.bannerAdUnitID = adUnitId
            case .interstitial:
                UserSettings.interstitialAdUnitID = adUnitId
            case .video:
                UserSettings.videoAdUnitID = adUnitId
            case .native:
                UserSettings.nativeAdUnitID = adUnitId
            default:
                break
            }

            self.setDefaultDataSource()
            self.updateRelations()
        }

        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        adUnitController.modalPresentationStyle = .overCurrentContext

        self.present(adUnitController, animated: true)
    }

    // MARK: - Private

    private func setupUI() {
        if items == nil {
            setDefaultDataSource()
        }
        setupCommonProperties()
        setupSegmentControl()
        setupAdTypeSelector()
        adUnitTextField.isUserInteractionEnabled = false
    }

    private func setupCommonProperties() {
        self.navigationController?.navigationBar.barTintColor = AppConstants.mainColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.view.backgroundColor = AppConstants.mainColor
    }

    private func setupSegmentControl() {
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

    private func setupAdTypeSelector() {
        scrollView.segmentedControl = segmentControl
        scrollView.scrollDirection = .horizontal
        scrollView.scrollOnSegmentChange = true

        fillAdTypes()
    }

    private func fillAdTypes() {
        var offset = 0
        let width = Int(scrollView.frame.size.width)
        let height = Int(scrollView.frame.size.height)
        var previousView: UIImageView?
        for (index, _) in segmentControl.items.enumerated() {
            let imageView = createImageView(withIndex: index)
            imageView.frame = CGRect(x: offset, y: 0, width: width, height: height)
            scrollView.addSubview(imageView)

            scrollView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[imageView(==scrollView)]|",
                         options: NSLayoutFormatOptions(),
                         metrics: nil,
                         views: ["imageView": imageView,
                                 "scrollView": scrollView!]))

            if let _ = previousView {
                scrollView.addConstraints(NSLayoutConstraint.constraints(
                    withVisualFormat: "H:[previousView][imageView(==previousView)]",
                    options: NSLayoutFormatOptions(),
                    metrics: nil,
                    views: ["imageView": imageView,
                            "previousView": previousView!]))
            } else {
                scrollView.addConstraints(NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[imageView(==scrollView)]",
                    options: NSLayoutFormatOptions(),
                    metrics: nil,
                    views: ["imageView": imageView,
                            "scrollView": scrollView!]))
            }

            offset += width
            previousView = imageView

        }

        scrollView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:[previousView]|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["previousView": previousView!]))

        scrollView.contentSize = CGSize(width: offset, height: height)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }

    private func createImageView(withIndex index: Int) -> UIImageView {
        let imageView = UIImageView(frame: CGRect.zero)
        guard let all = items, index < all.count, let image = all[index].image else {return imageView}

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.backgroundColor = UIColor.clear
        imageView.image = UIImage(named: image)

        return imageView
    }

    private func updateRelations() {
        let index = segmentControl.selectedSegmentIndex
        updateAdUnitID()
        tableVC?.adItems = items?[index].childItems
        tableVC?.update()
    }

    private func updateAdUnitID() {
        switch DZSegmentType(rawValue: segmentControl.selectedSegmentIndex)! {
        case .segmentBanner:
            adUnitTextField.text = UserSettings.bannerAdUnitID
        case .segmentInterstitial:
            adUnitTextField.text = UserSettings.interstitialAdUnitID
        case .segmentVideo:
            adUnitTextField.text = UserSettings.videoAdUnitID
        case .segmentNative:
            adUnitTextField.text = UserSettings.nativeAdUnitID
        }
    }
}

extension MainViewController {
    func setDefaultDataSource() {
        items = [
            MasterTableItem(title: "Banner", childItems: [
                MasterTableItem(title: "Standard size (320*50)", controller: "BannersDetailViewController", xibName: nil, childItems: nil, userData: ["bannerType": AVOBannerViewSizeSmall,
                     "adUnitId": UserSettings.bannerAdUnitID]),
                MasterTableItem(title: "Tablet size (728*90)", controller: "BannersDetailViewController", xibName: nil, childItems: nil, userData: ["bannerType": AVOBannerViewSizeLarge,
                     "adUnitId": UserSettings.bannerAdUnitID]),
                MasterTableItem(title: "MREC size (300*250)", controller: "BannersDetailViewController", xibName: nil, childItems: nil, userData: ["bannerType": AVOBannerViewSizeMREC,
                     "adUnitId": UserSettings.bannerAdUnitID]),
                ],
                image: "adtype_banner"
            ),
            MasterTableItem(title: "Interstitial", childItems: [
                MasterTableItem(title: "Interstitial", controller: "InterstitialsDetailViewController", xibName: nil, childItems: nil, userData: ["adUnitId": UserSettings.interstitialAdUnitID])
                ],
                image: "adtype_interstitial"
            ),
            MasterTableItem(title: "Video", childItems: [
                MasterTableItem(title: "Video", controller: "VideoDetailViewController", xibName: nil, childItems: nil, userData: ["adUnitId": UserSettings.videoAdUnitID])
                ],
                image: "adtype_video"
            ),
            MasterTableItem(title: "Native", childItems:  [
                MasterTableItem(title: "List", controller: "NativeAdDemonstratorViewController", xibName: nil, childItems: nil, userData: ["template": AVONativeAdsTemplateType.list, "adUnitId": UserSettings.nativeAdUnitID]
                ),
                MasterTableItem(title: "Feed", controller: "NativeAdDemonstratorViewController", xibName: nil, childItems: nil, userData: ["template": AVONativeAdsTemplateType.feed, "adUnitId": UserSettings.nativeAdUnitID]
                ),
                MasterTableItem(title: "Grid", controller: "NativeAdDemonstratorViewController", xibName: nil, childItems: nil, userData: ["template": AVONativeAdsTemplateType.grid, "adUnitId": UserSettings.nativeAdUnitID]
                ),
                MasterTableItem(title: "Custom", controller: "NativeAdDemonstratorViewController", xibName: nil, childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID]
                ),
                MasterTableItem(title: "Dynamic template from server", controller: "NativeAdDemonstratorViewController", xibName: nil, childItems: nil, userData: ["template": AVONativeAdsTemplateType.server, "adUnitId": UserSettings.nativeAdUnitID]
                ),
                MasterTableItem(title: "AdsProvider (stream adapter alternative)", controller: "AdsProviderTableViewController", xibName: "BaseTableViewController", childItems: nil, userData: ["adUnitId": UserSettings.nativeAdUnitID])
                ], image: "adtype_native"
            )]
    }
}

extension MainViewController: DZNSegmentedControlDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .bottom
    }
}

extension UIView {

    func takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)

        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
