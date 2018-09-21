//
//  ViewController.swift
//  AudioKitSynth
//
//  Created by Charles Martin Reed on 9/19/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    //MARK:- Create the oscillators
    var oscillator = AKOscillator()
    var oscillator2 = AKOscillator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- hook up the oscillators to the speakers and start the AK engine
        AudioKit.output = AKMixer(oscillator, oscillator2)
        
        //using try optionally here becauase this throws but I don't need to handle an potential errors at this point
        try? AudioKit.start()
    }
    
    
    @IBAction func toggleSound(_ sender: UIButton) {
        //MARK:- if the oscillator is playing, turn it off. If it's not playing, start it up and display the Hz in the button.
        if oscillator.isPlaying {
            oscillator.stop()
            sender.setTitle("Play Sine Wave", for: .normal)
        } else {
            //random(in:) replaces the depreciated random func from AudioKit
            oscillator.amplitude = random(in: ClosedRange<Double>(uncheckedBounds: (lower: 0.5, upper: 1)))
            oscillator.frequency = random(in: ClosedRange<Double>(uncheckedBounds: (lower: 220, upper: 880)))
            
            oscillator.start()
            sender.setTitle("Stop Sine Wave at \(Int(oscillator.frequency))Hz", for: .normal)
        }
        
    }
    

}

