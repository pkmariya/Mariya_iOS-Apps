//
//  ViewController.swift
//  Text2SpeechApp
//
//  Created by Mariya Arul Raj on 06/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentCtr: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func speechBtn(_ sender: UIButton) {
        var lang: String = "en-US"
        
        switch segmentCtr.selectedSegmentIndex {
        case 0:
            lang = "en-US"
            break;
        case 1:
            lang = "fr-FR"
            break;
        case 2:
            lang = "de-DE"
            break;
        case 3:
            lang = "es-ES"
            break;
        case 5:
            lang = "it-IT"
            break;
        default:
            lang = "en_US"
            break;
        }
        
        self.readMe(myText: textView.text, myLang: lang)
    }
    
    func readMe(myText: String, myLang: String) {
        let utterence = AVSpeechUtterance(string: myText)
        utterence.voice = AVSpeechSynthesisVoice(language: myLang)
        utterence.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterence)
    }
}

