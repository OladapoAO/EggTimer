

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 5, "Medium" : 10 , "Hard" : 15]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var eggProgView: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        secondsPassed = 0
        eggProgView.progress = 0.0
        Label.text = hardness
        
       
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter () {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
        
            eggProgView.progress = Float(percentageProgress)
            
        } else {
            timer.invalidate()
            Label.text = "DONE!"
            playSound()
        }
    }
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}

