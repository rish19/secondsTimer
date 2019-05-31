//
//  ViewController.swift
//  secondsTimer
//
//  Created by Rishabh Bhandari on 31/05/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var sliderValue = 0
    
    var timer = Timer()
    
    var audioPlayer = AVAudioPlayer()
    
    
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func timeSet(_ sender: UISlider) {
        
        
        sliderValue = Int(sender.value)
        
        timeLabel.text = String(sliderValue)
        
        
    }
    
    
    @IBAction func startTimer(_ sender: Any) {
        
        audioPlayer.pause()
        audioPlayer.currentTime = 0
    
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
    
    }
    
    @objc func action()
    {
        sliderValue = sliderValue - 1
        timeLabel.text = String(sliderValue)
        
        if sliderValue == 0
        
        { timer.invalidate()
            audioPlayer.play()
    
            
        }
        
    }
    


    @IBAction func stopTimer(_ sender: Any) {
        
        timer.invalidate()
    }
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderValue = Int(sliderOutlet.value)
        
        timeLabel.text = String(sliderValue)
        
        do {
        let audioPath = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        
        try
            audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            print("error")
        }

    }


}

