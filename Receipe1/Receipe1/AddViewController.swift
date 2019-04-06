//
//  AddViewController.swift
//  Receipe1
//
//  Created by Mariya Arul Raj on 16/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleText: UITextField!
    @IBOutlet var recipeContent: UITextView!
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        addButton.isEnabled = false
/*
        NotificationCenter.default.addObserver(self, selector: Selector(("recipeContentDidChange")), name: UITextView.textDidChangeNotification, object: nil)
   
        NotificationCenter.default.addObserver(self, selector: Selector(("textTitleDidChange")), name: UITextField.textDidChangeNotification, object: nil)
*/
    }
    
    func textTitleDidChange() {
        handleButtonStates()
    }
  
    func recipeContentDidChange(){
        handleButtonStates()
    }
    
    @IBAction func doneButton_click(_ sender: Any) {
        recipeContent.resignFirstResponder()
    }
    
    @IBAction func titleDoneButton_click(_ sender: Any) {
        titleText.resignFirstResponder()
    }
    
    func handleButtonStates() {
        if(recipeContent.text != ""){
            doneButton.isEnabled = true
        }
        else {
            doneButton.isEnabled = false
        }
        
        if(titleText.text != "" && recipeContent.text != ""){
            addButton.isEnabled = true
            addButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            }
        else {
            addButton.isEnabled = false
            addButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
            
        }
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
