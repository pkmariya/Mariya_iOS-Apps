//
//  ViewController.swift
//  PDOQuiz
//
//  Created by Mariya Arul Raj on 19/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    // PDOQuiz-Bridging-Header.h
    
    let allQuestions = QuestionBank()
    
    var questionNumber: Int = 0
    var userAnswer: Bool = true
    var scoreValue: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
    }

    @IBAction func pressedAnswer(_ sender: UIButton) {
        if sender.tag == 1{
            userAnswer = true
        } else if sender.tag == 2 {
            userAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if userAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            scoreValue += 1
        } else {
            ProgressHUD.showError("Incorrect")
        }
    }
    
    func nextQuestion () {
        if questionNumber < allQuestions.list.count{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "Quiz is complete, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default,  handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(scoreValue)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestions.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / 10) * CGFloat(questionNumber+1)
    }
    
    func startOver() {
        questionNumber = 0
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreValue = 0
        scoreLabel.text = "Score: 0"
        progressLabel.text = "1 / 10"
    }
    
}

