//
//  ViewController.swift
//  Xylophone
//
//  Created by Mariya Arul Raj on 09/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func notPressed(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag - 1])
    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        audioPlayer!.stop()
    }
    
    func playSound(soundFileName: String){
        let path = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        }catch {
            print("unable to load audio file")
        }
        audioPlayer!.play()
    }
}
