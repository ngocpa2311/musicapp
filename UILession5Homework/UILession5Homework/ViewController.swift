//
//  ViewController.swift
//  UILession5Homework
//
//  Created by Admin on 5/10/17.
//  Copyright © 2017 ngocpa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var playSound: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = Bundle.main.path(forResource: "Highscore", ofType: "mp3")
        let url = URL(fileURLWithPath: audioPath!)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            playSound = sound
        } catch {
            
        }
        let time = playSound.duration
        let minutes = Int((time.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        let timeTrack = String(format: "%d:%02d", minutes, seconds)
        lbTimeDuration.text = String(timeTrack)
        

    }
    
    @IBOutlet weak var slideSound: UISlider!
    
    @IBOutlet weak var lbNameTrack: UILabel!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var lbTimeDuration: UILabel!
    
    @IBAction func sliderSoundChange(_ sender: UISlider) {
        slideSound.maximumValue = Float(playSound.duration)
        slideSound.minimumValue = 0
        //slideSound.value = Float(playSound.currentTime)
        playSound.currentTime = TimeInterval(slideSound.value)
        let time = slideSound.value
        let minutes = Int((time.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        let timeTrack = String(format: "%d:%02d", minutes, seconds)
        lbTimer.text = String(timeTrack)
    }
    
    func updateSlide()  {
        let update = playSound.currentTime / playSound.duration
        slideSound.setValue(Float(update), animated: true)
    }
    
    
    @IBAction func playTapped(_ sender: UIButton) {
        playSound.play()
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        playSound.pause()
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        playSound.stop()
        playSound.currentTime = 0
    }

    @IBOutlet weak var slideVolume: UISlider!
    @IBAction func sliderVolume(_ sender: UISlider) {
        playSound.volume = slideVolume.value
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

