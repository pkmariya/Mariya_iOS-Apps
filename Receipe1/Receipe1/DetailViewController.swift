//
//  DetailViewController.swift
//  Receipe1
//
//  Created by Mariya Arul Raj on 16/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var preRecipe:String?
    @IBOutlet var recipeContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = preRecipe
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
