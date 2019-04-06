//
//  ViewController.swift
//  SpeechRecognizer
//
//  Created by Mariya Arul Raj on 06/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var segmentCtr: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    private var speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en_US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private var audioEngine = AVAudioEngine()
    var lang: String = "en_US"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.isEnabled = false
        
        speechRecognizer?.delegate = self as? SFSpeechRecognizerDelegate
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            var isButtonEnabled = false
            
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition is restricted on this device")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition is not yet authorize")
            }
            
            OperationQueue.main.addOperation {
                self.startStopButton.isEnabled = isButtonEnabled
            }
        }
    }

    @IBAction func startStopAction(_ sender: Any) {
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
        
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            startStopButton.isEnabled = false
            startStopButton.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            startStopButton.setTitle("Stop Recording", for: .normal)
        }
    }
    
    func startRecording() {
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitioRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil {
                self.textView.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.startStopButton.isEnabled = true
            }
        })
        
        let recordingEvent = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingEvent) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error")
        }
        
        textView.text = "Say something, I'm listening"
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            startStopButton.isEnabled = true
        } else {
            startStopButton.isEnabled = false
        }
    }
    
    @IBAction func segmentAct(_ sender: Any) {
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
        case 4:
            lang = "it-IT"
            break;
        default:
            lang = "en-US"
            break;
        }
    speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
    }
    
    @IBAction func readTheText(_ sender: UIButton) {
        let utterence = AVSpeechUtterance(string: textView.text)
        utterence.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterence.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterence)
    }
}

