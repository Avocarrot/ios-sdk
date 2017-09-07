//
//  TableViewStreamController.swift
//  DemoAppSwift
//
//  Created by Glispa GmbH on 12.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit

class TableViewStreamController: BaseTableViewController , UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var dataSource: [[DataUnit]] = [[DataUnit]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StreamAdapterTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(StreamAdapterTableViewCell.self)) as! StreamAdapterTableViewCell
        
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
        dataSource = DataUnitManager.createDataUnitList(20, dividedByGroups: 2)
    }
    
}

