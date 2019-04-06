//
//  ViewController.swift
//  myCoreDB
//
//  Created by Mariya Arul Raj on 25/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    
    @IBAction func saveUser(_ sender: UIButton) {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(self.firstNameField.text, forKey: "firstName")
        newUser.setValue(self.lastNameField.text, forKey: "lastName")
        
        do{
            try context.save()
        }catch {
            print("Error while saving the data")
        }
    }
    
    @IBAction func showAllUsers(_ sender: UIButton) {
    }
    
}

