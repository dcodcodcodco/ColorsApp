//
//  ViewController.swift
//  Colors
//
//  Created by Alex on 29.03.2021.
//

import UIKit

class ChangeColorViewController: UIViewController {

    @IBOutlet weak var colourView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    
    var colorForView: UIColor!
    var delegate: ChangeColorViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        colourView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setSliderValue()
        setColor()
        setValue(for: redSliderValue, greenSliderValue, blueSliderValue)
    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValue(for: redSliderValue)
        case greenSlider: setValue(for: greenSliderValue)
        default: setValue(for: blueSliderValue)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.colorToMainVC(
            redColor: CGFloat(redSlider.value),
            greenColor: CGFloat(greenSlider.value),
            blueColor: CGFloat(blueSlider.value)
        )
        dismiss(animated: true)
    }
    
    private func setColor() {
        colourView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redSliderValue:
                label.text = string(from: redSlider)
            case greenSliderValue:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func setSliderValue() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        colorForView.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
}
