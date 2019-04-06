//
//  QuestionBank.swift
//  PDOQuiz
//
//  Created by Mariya Arul Raj on 19/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        let item = Question(text: "A product is something that delivers value/service.", correctAnswer: true)
        list.append(item)
        
        list.append(Question(text: "The tool used for backlog management is CA Agile Central.", correctAnswer: true))
        list.append(Question(text: "The correct hierarchy from smaller to bigger is: User Story, Features, Sub Epics and Epic.", correctAnswer: true))
        list.append(Question(text: "Velocity of two product teams within a product line must be equal.", correctAnswer: false))
        list.append(Question(text: "An Expedition comprises of Basecamps and Treks.", correctAnswer: true))
        list.append(Question(text: "All teams in a product line must move to the same target basecamp.", correctAnswer: false))
        list.append(Question(text: "Recommended product team size is: 7 to 9.", correctAnswer: true))
        list.append(Question(text: "Daily Standups are timeboxed.", correctAnswer: true))
        list.append(Question(text: "Product Manager defines the priority of User Stories.", correctAnswer: false))
        list.append(Question(text: "Expeditions are approved by Transformation Council.", correctAnswer: true))
    }
}
