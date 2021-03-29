//
//  ViewController.swift
//  Colors
//
//  Created by Alex on 29.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redSliderValue: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenSliderValue: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueSliderValue: UILabel!
    
    @IBOutlet weak var colourView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSliderValue.text = String(redSlider.value)
        redSlider.minimumTrackTintColor = .red
        
        greenSliderValue.text = String(greenSlider.value)
        greenSlider.minimumTrackTintColor = .green
        
        blueSliderValue.text = String(blueSlider.value)
        blueSlider.minimumTrackTintColor = .blue
    }

    @IBAction func redSliderAction() {
        redSliderValue.text = String(format: "%.1f", redSlider.value)
        let sliderValue = CGFloat(redSlider.value)
        colourView.backgroundColor = .red
        colourView.backgroundColor = colourView.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValue.text = String(format: "%.1f", greenSlider.value)
        let sliderValue = CGFloat(greenSlider.value)
        colourView.backgroundColor = .green
        colourView.backgroundColor = colourView.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = String(format: "%.1f", blueSlider.value)
        let sliderValue = CGFloat(blueSlider.value)
        colourView.backgroundColor = .blue
        colourView.backgroundColor = colourView.backgroundColor?.withAlphaComponent(sliderValue)
    }
}

