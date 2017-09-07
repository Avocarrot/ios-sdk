//
//  AdsProviderTableViewController.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 12.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeView

@objc(AdsProviderTableViewController)
class AdsProviderTableViewController: BaseTableViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var dataSource: [[DataUnit]] = [[DataUnit]]()
    fileprivate var adsProvider: AVONativeAdsProvider?
    fileprivate var adsArray: [Int: UIView]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        loadAds()
    }
    
    //MARK: - Table View    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adsArray == nil ? dataSource[section].count : dataSource[section].count + 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let _ = adsArray {
            //there're ads
            if indexPath.row == 0 {
                //insert ad on top of each section
                cell = getAdsCell(forIndexPath: indexPath)
            } else {
                let originalIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
                cell = getDataCell(forIndexPath: originalIndexPath)
            }
        } else {
            // no ads
            cell = getDataCell(forIndexPath: indexPath)
        }
        
        cell.layoutIfNeeded()
        return cell
    }
    
    fileprivate func getDataCell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StreamAdapterTableViewCell") as? StreamAdapterTableViewCell else {
            return UITableViewCell()
        }
        
        let item = dataSource[indexPath.section][indexPath.row]
        
        cell.tweetNameLabel.text = item.name
        if item.photo == nil {
            cell.tweetImageView.image = nil
        } else {
            cell.tweetImageView.image = UIImage(named: item.photo)
        }
        
        cell.tweetTextLabel.text = item.specification
        return cell
    }
    
    fileprivate func getAdsCell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell"), adsArray != nil else {
            return UITableViewCell()
        }
        
        cell.contentView.subviews.forEach(){
            $0.removeFromSuperview()
        }
        
        if adsArray?[indexPath.section] == nil {
            guard let  adView = adsProvider?.getNextAdView() else {
                return UITableViewCell()
            }
            adsArray?[indexPath.section] = adView
        }
        
        guard let adView = adsArray?[indexPath.section] else {
            return UITableViewCell()
        }
        
        cell.contentView.addSubview(adView)
        
        let views = ["adView" : adView]
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[adView]|", options: [], metrics: nil, views: views))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[adView]|", options: [], metrics: nil, views: views))
        
        return cell
    }
    
    //MARK: Ads
    private func loadAds() {
        adsProvider = AvocarrotSDK.shared.createNativeAdsProvider(forAdunit: adUnitId, templateType: .list, templateCustomization: { (templateCustomizationObject) in
                templateCustomizationObject.avoCTABorderWidth = 1
                templateCustomizationObject.avoCTACornerRadius = 5
            })
        
        adsProvider?.preloadAds(inCache: 3, parentViewController: self, didLoad: {[weak self] (count) in
            guard let sSelf = self else {return}
            sSelf.adsArray = [Int: UIView]()
            sSelf.tableView.reloadData()
            }, didFail: { (error) in
                print("Native Ads Provider error: \(error)")
        })
    }
    
    // MARK: Private
    private func setupUI() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 140.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AdsTableViewCell")
    }
    
    // MARK: Data management
    private func loadData() {
        dataSource = DataUnitManager.createDataUnitList(100, dividedByGroups: 10)
    }
}
