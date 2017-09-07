//
//  BaseFlowLayoutCollectionViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import Foundation

@objc(BaseFlowLayoutCollectionViewController)
    class BaseFlowLayoutCollectionViewController: BaseCollectionViewController,
                                                  UICollectionViewDelegate,
                                                  UICollectionViewDataSource,
                                                  UICollectionViewDelegateFlowLayout {

    var dataSource: [[DataUnit]] = [[DataUnit]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib.init(nibName: NSStringFromClass(StreamAdapterCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: NSStringFromClass(StreamAdapterCollectionViewCell.self))
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: StreamAdapterCollectionViewCell = collectionView.avo_dequeueReusableCell(withReuseIdentifier: "StreamAdapterCollectionViewCell", for: indexPath) as! StreamAdapterCollectionViewCell

        let item: DataUnit = self.dataSource[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        cell.tweetNameLabel.text = item.name
        if let imageHeightConstraint = cell.tweetImageHeightConstraint {
            if item.photo == nil {
                imageHeightConstraint.constant = 0
            } else {
                imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
            }
        }

        cell.tweetImageView.image = UIImage(named: item.photo)

        if let textLabel = cell.tweetTextLabel {
            textLabel.text = item.specification
        }

        cell.layoutIfNeeded()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int((collectionView.frame.size.width - 4) / 2.0), height: Int((collectionView.frame.size.width - 4) / 1.1))
    }

    func loadData(_ count: UInt) {
        dataSource = DataUnitManager.createDataUnitList(count, dividedByGroups: 2)
    }
}
