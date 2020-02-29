//
//  ViewController.swift
//  clipBoardCopy
//
//  Created by Mariya Arul Raj on 29/02/20.
//  Copyright © 2020 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY: String = "data_key"

    @IBOutlet weak var myText: UITextView!
    
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let loadedString = UserDefaults.standard.stringArray(forKey: DATA_KEY) {
            pastedStrings.append(contentsOf: loadedString)
        }
        showText()
    }
    
    func addText() {
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()
    }
    
    func showText() {
        myText.text = ""
        for str in pastedStrings {
            myText.text.append("\(str)\n--------------------------\n")
        }
    }
    
    @IBAction func trashButtonPressed(_ sender: Any) {
        pastedStrings.removeAll()
        myText.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
}

