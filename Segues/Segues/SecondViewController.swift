//
//  SecondViewController.swift
//  Segues
//
//  Created by Mariya Arul Raj on 13/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

protocol sendDataBack {
    func dataSent(data: String)
}

class SecondViewController: UIViewController {
    
    var delegate : sendDataBack?
    
    var data = ""
    
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var secondViewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewLabel.text = data
    }

    @IBAction func secondViewButtonPressed(_ sender: Any) {
        delegate?.dataSent(data: secondViewTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
