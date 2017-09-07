//
//  MasterTableViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    open var adItems: [MasterTableItem]?

    open func update() {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adItems?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.font = UIFont(name: "Helvetica", size: 16)
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.text = adItems?[(indexPath as NSIndexPath).row].title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = adItems?[(indexPath as NSIndexPath).row] else { return }
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController: UIViewController? = nil
        var showBlock: (() -> Void)!
        if let xibName = item.xibName, let controllerName = item.controller {
            let viewControllerClass = NSClassFromString(controllerName) as! UIViewController.Type
            viewController = viewControllerClass.init(nibName: xibName, bundle: Bundle.main)
            showBlock = {self.navigationController?.pushViewController(viewController!, animated: true)}
        } else if let controllerName = item.controller {
            viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
            showBlock = {self.navigationController?.pushViewController(viewController!, animated: true)}
        } else if let items = item.childItems {
            let tableController = storyboard.instantiateViewController(withIdentifier: "MasterTableViewController") as! MasterTableViewController
            tableController.adItems = items
            tableController.title = item.title
            showBlock = {self.navigationController?.pushViewController(tableController, animated: true)}
            viewController = tableController
        }

        if let managedController = viewController as? AppControllerManagement,
            let userData = item.userData {
            managedController.applyUserData(userData)
        }
        
        showBlock()
    }
}
