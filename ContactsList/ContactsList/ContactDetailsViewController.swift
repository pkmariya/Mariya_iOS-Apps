//
//  ContactDetailsViewController.swift
//  ContactsList
//
//  Created by Mariya Arul Raj on 16/03/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    var contact: String?
    
    @IBOutlet var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.contactLabel.text = contact
        
    }

}
