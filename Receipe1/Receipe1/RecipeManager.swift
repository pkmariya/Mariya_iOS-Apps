//
//  RecipeManager.swift
//  Receipe1
//
//  Created by Mariya Arul Raj on 17/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    static var recipes = [Recipe]()
    
    class func AddRecipe(title: String, content: String){
        var r = Recipe(title: title, content: content)
        recipes.append(r)
    }
    
    class func DeleteRecipe(id: Int){
        recipes.remove(at: id)
    }
    
    class func GetRecipe(id: Int) -> Recipe {
        if(recipes.count > 0) {
            return recipes[id]
        }
        return Recipe()
    }

}
