//
//  ViewController.swift
//  Homework_Storyboard_3
//
//  Created by Анастасия Гаранович on 30.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    private let yellowColor = #colorLiteral(red: 0.8156862745, green: 0.568627451, blue: 0.1529411765, alpha: 1)
    private let lightGreyColor = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5254901961, alpha: 1)
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeProgress: UIProgressView!
    @IBOutlet weak var volumeTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        timeLabel.text = dateString()
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        timeLabel.text = ""
    }
    
    @IBAction func alarmOnAndOff(_ sender: UISwitch) {
        if sender.isOn {
            timeLabel.layer.borderColor = yellowColor.cgColor
            timeLabel.textColor = yellowColor
        }
        else {
            timeLabel.layer.borderColor = lightGreyColor.cgColor
            timeLabel.textColor = lightGreyColor
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        volumeProgress.progress = volumeSlider.value
        volumeTextField.text = String(round(volumeSlider.value * 1000) / 1000)
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        guard let floatValue = Float(volumeTextField.text ?? "") else {
            print("Error. Invalid value")
            return
        }
        volumeProgress.progress = floatValue
        volumeSlider.value = floatValue
    }
    
    private func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
        let dateString = dateFormatter.string(from: timePicker.date)
        return dateString
    }
    
    private func setupTimeLabel() {
        timeLabel.clipsToBounds = true
        timeLabel.layer.cornerRadius = 5
        timeLabel.layer.borderWidth = 3
        timeLabel.layer.borderColor = lightGreyColor.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimeLabel()
    }
    
}
