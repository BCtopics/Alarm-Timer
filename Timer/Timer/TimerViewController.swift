//
//  TimerViewController.swift
//  Timer
//
//  Created by Bradley GIlmore on 6/28/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hoursPickerView.delegate = self
        hoursPickerView.dataSource = self
        
        minutesPickerView.delegate = self
        minutesPickerView.dataSource = self
    }
    
    //MARK: - PickerViewDelegate and DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView === hoursPickerView {
            return 24
        } else if pickerView === minutesPickerView {
            return 60
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPickerView: UIPickerView!
    @IBOutlet weak var minutesPickerView: UIPickerView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pickerStackView: UIStackView!
    
    //MARK: - IBActions

}
