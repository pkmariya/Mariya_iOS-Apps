//
//  ViewController.swift
//  myTest
//
//  Created by Mariya Arul Raj on 23/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var clickMe: UIButton!
    @IBOutlet weak var lableText: UILabel!
    
    @IBAction func pressButton(_ sender: UIButton) {
        clickMe.backgroundColor = UIColor.cyan
        lableText.text = "Clicked"
        lableText.backgroundColor = UIColor.black
        lableText.textColor = UIColor.white
    }
}

