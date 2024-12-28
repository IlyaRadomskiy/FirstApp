
import UIKit

enum CurrentLight {
    case red, yellow, green
}
    
class ViewController: UIViewController {
    
    @IBOutlet var redlight: UIView!
    @IBOutlet var yellowlight: UIView!
    @IBOutlet var greenlight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let LightIsOn: CGFloat = 1
    private let LightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redlight.alpha = LightIsOff
        yellowlight.alpha = LightIsOff
        greenlight.alpha = LightIsOff
    }
    override func viewWillLayoutSubviews() {
        redlight.layer.cornerRadius = redlight.frame.width / 2
        yellowlight.layer.cornerRadius = yellowlight.frame.width / 2
        greenlight.layer.cornerRadius = greenlight.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "Press to Change"{
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenlight.alpha = LightIsOff
            redlight.alpha = LightIsOn
            currentLight = .yellow
        case .yellow:
            redlight.alpha = LightIsOff
            yellowlight.alpha = LightIsOn
            currentLight = .green
        case .green:
            greenlight.alpha = LightIsOn
            yellowlight.alpha = LightIsOff
            currentLight = .red
        }
    }
}
