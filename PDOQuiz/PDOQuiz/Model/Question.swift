//
//  Question.swift
//  PDOQuiz
//
//  Created by Mariya Arul Raj on 19/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import Foundation


class Question {
    let questionText: String
    let answer: Bool
    
    init (text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
