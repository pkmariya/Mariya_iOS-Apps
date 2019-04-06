//
//  Recipe.swift
//  Receipe1
//
//  Created by Mariya Arul Raj on 17/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    var title: String?
    var content: String?
    
    init (title: String, content: String){
        self.title = title
        self.content = content
    }
    
    override init(){
        super.init()
    }
}
