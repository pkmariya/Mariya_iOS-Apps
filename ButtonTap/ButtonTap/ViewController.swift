//
//  ViewController.swift
//  ButtonTap
//
//  Created by Mariya Arul Raj on 01/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UILabel!

    @IBAction func ButtonPressed(_ sender: UIButton) {
        displayText.text = sender.title(for: [])!
    }
}

