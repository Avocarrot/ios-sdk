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
class BaseTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var adUnitId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: NSStringFromClass(StreamAdapterTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: NSStringFromClass(StreamAdapterTableViewCell.self))
    }
}

extension BaseTableViewController: AppControllerManagement {
    func applyUserData(_ userData: [String:Any]) {
        if let adId = userData["adUnitId"] as? String {
            adUnitId = adId
        }
    }
}
