//
//  CreateAdUnitIdViewController.swift
//  DemoApp
//
//  Created by Glispa GmbH on 08.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit

enum AdType: String {
    case banner
    case interstitial
    case video
    case native
    case nativeassets
    case unknown
}

class AdUnitId: NSObject, NSCoding {
    var adUnitId: String?
    var adType: AdType = .unknown
    
    convenience init(adUnitId: String, adType type: AdType) {
        self.init()
        self.adUnitId = adUnitId
        self.adType = type
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(adUnitId, forKey: "adUnitId")
        aCoder.encode(adType.rawValue, forKey: "adUnitType")
    }

    required convenience init(coder decoder: NSCoder) {
        self.init()
        adUnitId = decoder.decodeObject(forKey: "adUnitId") as? String
        adType = AdType(rawValue: decoder.decodeObject(forKey: "adUnitType") as! String)!
    }
}

class CreateAdUnitIdViewController: UIViewController {
    @IBOutlet weak var adUnitsTableView: UITableView!
    @IBOutlet weak var adTypesPicker: UIPickerView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var adUnitIdTextField: UITextField!

    var backgroundImage: UIImage?

    var backBlock: ((String, AdType) -> Void)?

    fileprivate var adUnits: [AdUnitId]?
    fileprivate let adTypes: [AdType] = [.banner, .interstitial, .video, .native, .nativeassets]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    private func setupUI() {
        fillBackgroundImageView()
    }

    private func setupData() {
        readAdUnitsFromUserDefaults()
    }

    private func fillBackgroundImageView() {
        guard let image = backgroundImage else {
            return
        }
        backgroundImageView.image = image
    }

// MARK: - Action

    @IBAction func closeClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    @IBAction func createClicked(_ sender: UIButton) {
        createNewAdUnitId()
    }
    
// MARK: - Privatre
    
    private func createNewAdUnitId() {
        if let text = adUnitIdTextField.text, isValidAdUnitId(text) {
            let adUnit = AdUnitId(adUnitId: text, adType: adTypes[adTypesPicker.selectedRow(inComponent: 0)])
    
            if adUnits?.filter({$0.adUnitId == text}).count == 0 {
                adUnits?.append(adUnit)
                saveAdUnitsToUserDefaults()
            }
    
            backBlock?(adUnit.adUnitId!, adUnit.adType)
            self.dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Invalid format of adUnitId", message: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CreateAdUnitIdViewController {
    func isValidAdUnitId(_ adUnitId: String?) -> Bool {
        let allowedSymbols = "^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"
        let allowedRegEx = NSPredicate(format:"SELF MATCHES %@", allowedSymbols)
        guard allowedRegEx.evaluate(with: adUnitId) else { return false }
        return true
    }
}

extension CreateAdUnitIdViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adUnits?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        guard let item = adUnits?[indexPath.row] else { return cell }
        cell.textLabel?.text = item.adUnitId
        cell.detailTextLabel?.text = item.adType.rawValue

        cell.backgroundColor = UIColor.clear
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = adUnits?[indexPath.row] else { return }
        backBlock?(item.adUnitId!, item.adType)
        self.dismiss(animated: true)
    }
}

extension CreateAdUnitIdViewController {
    private func adUnitsKey() -> String {
        return "savedAdUnitsArray"
    }

    fileprivate func saveAdUnitsToUserDefaults() {
        let data = NSKeyedArchiver.archivedData(withRootObject: adUnits!)
        UserDefaults.standard.set(data, forKey: adUnitsKey())
    }

    fileprivate func readAdUnitsFromUserDefaults() {

        guard let data = UserDefaults.standard.object(forKey: adUnitsKey()) as? Data else {
            adUnits = defaulAdUnitIds()
            return
        }

        guard let array = NSKeyedUnarchiver.unarchiveObject(with: data) as? [AdUnitId] else {
            adUnits = defaulAdUnitIds()
            return
        }

        adUnits = array
    }
    
    fileprivate func defaulAdUnitIds() -> [AdUnitId] {
        return [AdUnitId(adUnitId: DefaultAdUnitId.bannerAdUnitID, adType: .banner),
                AdUnitId(adUnitId: DefaultAdUnitId.interstitialAdUnitID, adType: .interstitial),
                AdUnitId(adUnitId: DefaultAdUnitId.videoAdUnitID, adType: .video),
                AdUnitId(adUnitId: DefaultAdUnitId.nativeAdUnitID, adType: .native),
                AdUnitId(adUnitId: DefaultAdUnitId.nativeAssetsAdUnitID, adType: .nativeassets)]
    }
}

extension CreateAdUnitIdViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return adTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return adTypes[row].rawValue
    }
}

extension CreateAdUnitIdViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
