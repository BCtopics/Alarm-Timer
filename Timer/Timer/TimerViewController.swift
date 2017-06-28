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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimerBasedViews(_:)), name: .secondTickNotification, object: timer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(timerComplete(_:)), name: .timerCompleteNotification, object: timer)
        
        minutesPickerView.selectRow(1, inComponent: 0, animated: false)
        
        view.layoutIfNeeded()
        
        pauseButton.layer.cornerRadius = pauseButton.bounds.height / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.layer.borderWidth = 2.0
        pauseButton.layer.borderColor = UIColor.blueTimerColor.cgColor
        
        startButton.layer.cornerRadius = startButton.bounds.height / 2
        startButton.layer.masksToBounds = true
        startButton.layer.borderWidth = 2.0
        startButton.layer.borderColor = UIColor.lightBlueTimerColor.cgColor
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
    
    //MARK: - Properties
    
    var timer = Timer()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPickerView: UIPickerView!
    @IBOutlet weak var minutesPickerView: UIPickerView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pickerStackView: UIStackView!
    
    //MARK: - IBActions
    
    @IBAction func startButtonTapped(_ sender: Any) {
        toggleTimer()
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
       timer.togglePause()
    }
    
    //MARK: Private
    
    private func toggleTimer() {
        if timer.isOn {
            timer.stop()
            switchToPickerView()
        } else {
            switchToTimerView()
            
            let hours = hoursPickerView.selectedRow(inComponent: 0)
            let minutes = minutesPickerView.selectedRow(inComponent: 0) + (hours * 60)
            let totalSecondsSetOnTimer = TimeInterval(minutes * 60)
            
            timer.setTimer(totalSecondsSetOnTimer, totalSeconds: totalSecondsSetOnTimer)
            updateTimerBasedViews()
            timer.start()
        }
    }
    
    private func updateTimerLabel() {
        timerLabel.text = timer.timeRemainingString
    }
    
    private func updateProgressView() {
        
        let secondsElasped = timer.totalSeconds - timer.secondsRemaining
        let progress = Float(secondsElasped) / Float(timer.totalSeconds)
        progressView.setProgress(progress, animated: true)
    }
    
    private dynamic func updateTimerBasedViews(_ notification: Notification) {
        updateTimerBasedViews()
    }
    
    private func updateTimerBasedViews() {
        updateTimerLabel()
        updateProgressView()
    }
    
    private dynamic func timerComplete(_ notification: Notification) {
        switchToPickerView()
    }
    
    private func switchToTimerView() {
        timerLabel.isHidden = false
        progressView.setProgress(0.0, animated: false)
        progressView.isHidden = false
        pickerStackView.isHidden = true
        startButton.setTitle("Cancel", for: [])
        
        startButton.setTitleColor(UIColor.blueTimerColor, for: [])
        startButton.layer.borderColor = UIColor.blueTimerColor.cgColor
        pauseButton.setTitleColor(UIColor.lightBlueTimerColor, for: [])
        pauseButton.layer.borderColor = UIColor.lightBlueTimerColor.cgColor
    }
    
    private func switchToPickerView() {
        pickerStackView.isHidden = false
        timerLabel.isHidden = true
        progressView.isHidden = true
        startButton.setTitle("Start", for: [])
        
        startButton.setTitleColor(UIColor.lightBlueTimerColor, for: [])
        startButton.layer.borderColor = UIColor.lightBlueTimerColor.cgColor
        pauseButton.setTitleColor(UIColor.blueTimerColor, for: [])
        pauseButton.layer.borderColor = UIColor.blueTimerColor.cgColor
    }
    
}
