//
//  EnterTheForest.swift
//  Power Animals Unleashed
//
//  Created by Administrator on 2/8/18.
//  Copyright © 2018 Scott Daly. All rights reserved.
//

import UIKit
import AVFoundation

class EnterTheForest: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    
    
    @IBAction func enterForestPressed(_ sender: UIButton) {
        
        player?.setVolume(0, fadeDuration: 1.5)
    
        
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        playSound()
    }
    
    
    func playSound() {
        let path = Bundle.main.path(forResource: "waterfall.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("couldn't load file :(")
        }
    }
    
    
    
    
    
    

}
