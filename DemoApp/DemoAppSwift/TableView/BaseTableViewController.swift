//
//  BaseTableViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import Foundation
import UIKit

@objc(BaseTableViewController)
class BaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    fileprivate
    var dataSource: [[DataUnit]] = [[DataUnit]]()

    public var adUnitId: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: NSStringFromClass(StreamAdapterTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: NSStringFromClass(StreamAdapterTableViewCell.self))
        loadData()
    }

    // MARK: TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StreamAdapterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StreamAdapterTableViewCell") as! StreamAdapterTableViewCell

        let item: DataUnit = self.dataSource[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]

        cell.tweetNameLabel.text = item.name
        if item.photo == nil {
            cell.tweetImageView.image = nil
        } else {
            cell.tweetImageView.image = UIImage(named: item.photo)
        }

        cell.tweetTextLabel.text = item.specification

        cell.layoutIfNeeded()

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    // MARK: Data management
    func loadData() {
        let units = DataUnitManager.createDataUnitList(20)
        organizeData(units, dividedBySectionsCount: 2)
    }

    func organizeData(_ dataArray: [DataUnit], dividedBySectionsCount sectionsCount: Int) {
        dataSource = [Array<DataUnit>]()
        let itemsInSection: Int = Int(dataArray.count / sectionsCount)
        var startPos: Int = 0
        for _ in 0..<sectionsCount {
            let lastPosition = min(startPos + itemsInSection, dataArray.count)
            let itemsGroupe = Array(dataArray[startPos..<lastPosition])
            startPos += itemsGroupe.count
            dataSource.append(itemsGroupe)
        }

        if startPos < dataArray.count {
            var itemsGroupe = dataSource[dataSource.count - 1]
            itemsGroupe += dataArray[startPos..<dataArray.count]
            dataSource[dataSource.count - 1] = itemsGroupe
        }
    }

}

extension BaseTableViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }
    }
}
