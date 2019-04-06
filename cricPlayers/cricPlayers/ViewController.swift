//
//  ViewController.swift
//  cricPlayers
//
//  Created by Mariya Arul Raj on 24/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sachinTab: UIButton!
    @IBOutlet weak var dhoniTab: UIButton!
    @IBOutlet weak var kohliTab: UIButton!
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBAction func displayImage(_ sender: UIButton) {
        let chosenPlayer = sender.currentTitle!
        self.playerImage.image = UIImage(named: chosenPlayer)
    }
}

