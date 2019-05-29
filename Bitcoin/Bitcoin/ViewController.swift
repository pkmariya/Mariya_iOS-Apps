//
//  ViewController.swift
//  Bitcoin
//
//  Created by Mariya Arul Raj on 20/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK",  "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "USD", "ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "Y", "E", "GBP", "$", "Rp", "ILS", "R", "Y", "$", "Kr", "$", "Zl", "lei", "p", "kr", "S$", "$", "R"]
    var currencySelected = ""
    
    var finalURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.delegate = self
        currencyPicker.dataSource = self

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
        currencySelected = currencySymbolArray[row]
        getBitcoinData(url: finalURL)
    }
    
    //MARK: - Networking
    
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get) .responseJSON { response in
            if response.result.isSuccess {
                print("Success! Got the Bitcoin data")
                let bitcoinJSON: JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    //MARK: - JSON Parsing
    
    func updateBitcoinData(json : JSON) {
        
        if let bitcoinResult = json["ask"].double {
            priceLabel.text = currencySelected + " " + String(bitcoinResult)
        } else {
            priceLabel.text = "Price Unavailable"
        }
    }
    
}

