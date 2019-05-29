//
//  ViewController.swift
//  SimpleChatApp
//
//  Created by Mariya Arul Raj on 18/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var messageTableView: UITableView!
    
    var messagesArray: [String] = [String]()
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var dockViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let testObject:PFObject = PFObject(className: "TestClass")
//        testObject["SomeProperty"] = "SomeValue"
//        testObject.saveInBackground(block: nil)
        
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        
        // set self as the delegate for the textfield
        self.messageTextField.delegate = self
        
        // Add a tap gesture recognizer to the tableView
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(tableViewTapped))
        self.messageTableView.addGestureRecognizer(tapGesture)
        
        // add some sample data
        self.messagesArray.append("Text 1")
        self.messagesArray.append("Text 2")
        self.messagesArray.append("Text 3")
        
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
            // send button is tapped
        
            // call the end editing method for the text field
        self.messageTextField.endEditing(true)
    }
    
    @objc func tableViewTapped(){
        self.messageTextField.endEditing(true)
    }
    
    // MARK: TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
              // perform an animation to grow the dockView
        UIView.animate(withDuration: 0.5, animations: {
            self.dockViewHeightConstraint.constant = 350
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // perform an animation to grow the dockView
        UIView.animate(withDuration: 0.5, animations: {
            self.dockViewHeightConstraint.constant = 60
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: TableView Delegate Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a table cell
        let cell = self.messageTableView.dequeueReusableCell(withIdentifier: "MessageCell") as! UITableViewCell
        
        // Customize the cell
        cell.textLabel?.text = self.messagesArray[indexPath.row]
        
        // return the cell
        return cell
    }


}

