import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        //Instead of using tags for this case, we could use the label itself. There's a way to pass
        //the label as a value, but as far as I can think, it would only be usefull in this case, which
        //the action (playing a sound) is really equal to the key label name.
        guard let tag = (sender as? UIButton)?.tag else{
            return
        }
        
        //Lowering the pressed button's opacity then increasing it assincronously
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
        switch tag{
        case 1:
            playSound(key: "C")
            break
        case 2:
            playSound(key: "D")
            break
        case 3:
            playSound(key: "E")
            break
        case 4:
            playSound(key: "F")
            break
        case 5:
            playSound(key: "G")
            break
        case 6:
            playSound(key: "A")
            break
        case 7:
            playSound(key: "B")
            break
        default:
            break
        }
    }
    
    func playSound(key: String){
        let soundFilePath = Bundle.main.path(forResource: key, ofType: "wav")!
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound file")
        }
    }
    

}

