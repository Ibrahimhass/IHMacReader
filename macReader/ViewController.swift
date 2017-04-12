//
//  ViewController.swift
//  macReader
//
//  Created by Md Ibrahim Hassan on 11/04/17.
//  Copyright © 2017 Md Ibrahim Hassan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let synthesizer = NSSpeechSynthesizer()
    
    var contents: String? {
    get {
       return (textView.string)
    }
    set {
    textView.string = newValue
    }
    }
    
    @IBOutlet weak var textView: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func speakButtonPressed(_ sender: Any) {
      if let contents = self.textView.string, !contents.isEmpty
      {
        synthesizer.startSpeaking(contents)
      }
        else
      {
        synthesizer.startSpeaking("I have nothing else to say to you as of now.")
      }
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        synthesizer.stopSpeaking()
    }

    @IBOutlet weak var speakButtonOutlet: NSButton!
    @IBOutlet weak var stopButtonOutlet: NSButton!
}

