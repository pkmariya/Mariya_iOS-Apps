//
//  ViewController.swift
//  firstResponder
//
//  Created by Mariya Arul Raj on 23/11/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var secondName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "App Loaded!"
        myTextField.becomeFirstResponder()
        myTextField.delegate = self
        secondName.delegate = self
    }

    @IBAction func buttonPressed(_ sender: Any) {
        myLabel.text = "Hi, \(myTextField.text!) \(secondName.text!)!"
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextField.resignFirstResponder()
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

