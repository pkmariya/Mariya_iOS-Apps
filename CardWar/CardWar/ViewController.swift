//
//  ViewController.swift
//  CardWar
//
//  Created by Mariya Arul Raj on 30/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    var cardNamesArray = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    
    var player1ScoreValue = 0
    var player2ScoreValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playRoundButton.setTitle("Play Now", for: UIControl.State.normal)
    }
    
    func flipCard(){
        // given below are 2 primitive ways of deriving the card number
        //        let cardNumber1 = String(arc4random_uniform(13) + 1)
        //        firstCardImageView.image = UIImage(named: "card" + cardNumber1)
        //
        //        let cardNumber2 = arc4random_uniform(13) + 1
        //        let secondCardNumber = String(format: "card%i", cardNumber2)
        //        secondCardImageView.image = UIImage(named: secondCardNumber)
        
        // more better way of getting the card number is,
        
        let randomNumber1 = Int(arc4random_uniform(UInt32(cardNamesArray.count)))
        let firstCardString = cardNamesArray[randomNumber1]
        firstCardImageView.image = UIImage(named: firstCardString)
        
        let randomNumber2 = Int(arc4random_uniform(UInt32(cardNamesArray.count)))
        let secondCardString = cardNamesArray[randomNumber2]
        secondCardImageView.image = UIImage(named: secondCardString)
        
        // increment the Scores
        
        if (randomNumber1 > randomNumber2){
            player1ScoreValue += 1
            self.player1Score.text = "\(player1ScoreValue)"
        } else if (randomNumber1 == randomNumber2){
            return
        } else {
            player2ScoreValue += 1
            self.player2Score.text = "\(player2ScoreValue)"
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        flipCard()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        flipCard()
    }
}

