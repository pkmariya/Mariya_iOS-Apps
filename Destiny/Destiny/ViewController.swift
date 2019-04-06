//
//  ViewController.swift
//  Destiny
//
//  Created by Mariya Arul Raj on 26/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var storyIndex: Int = 1
    
    let story1 = "Story1: Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to your. A man with a wide brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?\""
    let answer1a = "1A: I\'ll hop in. Thanks for the help!"
    let answer1b = "1B: Better ask him if he\'s a murderer first."
    
    let story2 = "Story2: He nods slowly, unphased by the question"
    let answer2a = "2A: At least he\'s honest. I\'ll climb in."
    let answer2b = "2B: Wait, I know how to change a tire."
    
    let story3 = "Story3: As you begin to drive, the strager starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "3A: I love Elton John! Hand him the cassette tape."
    let answer3b = "3B: It\'s him or me! You take the knife and stab him"
    
    let story4 = "Story4: What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    
    let story5 = "Story5: As you smash through the guarded and careen towards the jagged rocks below you reflect on the dubious wisdon of stabbing someone while they are driving a car you are in"
    
    let story6 = "Story6: You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know places to dump bodies. You reply: \"Try the pier.\""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restart()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if  (storyIndex == 1 || storyIndex == 2) && sender.tag == 1{
            storyTextView.text = story3
            firstButton.setTitle(answer3a, for: .normal)
            secondButton.setTitle(answer3b, for: .normal)
            storyIndex = 3
        } else if storyIndex == 1 && sender.tag == 2 {
            storyTextView.text = story2
            firstButton.setTitle(answer2a, for: .normal)
            secondButton.setTitle(answer2b, for: .normal)
            storyIndex = 2
        } else if storyIndex == 3 && sender.tag == 1 {
            storyTextView.text = story6
            firstButton.isHidden = true
            secondButton.isHidden = true
            storyIndex = 6
        } else if storyIndex == 3 && sender.tag == 2 {
            storyTextView.text = story5
            firstButton.isHidden = true
            secondButton.isHidden = true
            storyIndex = 5
        } else if storyIndex == 2 && sender.tag == 2 {
            storyTextView.text = story4
            firstButton.isHidden = true
            secondButton.isHidden = true
            storyIndex = 4
        }
        
        if storyIndex == 4 || storyIndex == 5 || storyIndex == 6 {
            restartButton.isHidden = false
        }
    }
    
    func restart() {
        storyTextView.text = story1
        firstButton.setTitle(answer1a, for: .normal)
        secondButton.setTitle(answer1b, for: .normal)
        storyIndex = 1
        firstButton.isHidden = false
        secondButton.isHidden = false
        restartButton.isHidden = true
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        restart()
    }
    
}

