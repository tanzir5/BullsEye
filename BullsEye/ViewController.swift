//
//  ViewController.swift
//  BullsEye
//
//  Created by Tanzir Islam on 30/4/19.
//  Copyright © 2019 Tanzir Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var currentRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNewGame()
    }
    
    @IBAction func initNewGame(){
        currentValue = 0
        score = 0
        currentRound = 0
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        var pointsScored = 100 - difference
        switch difference{
        case 0: pointsScored += 100
        case 1: pointsScored += 50
        default: pointsScored += 0
        }
        score += pointsScored
        let title: String
        if(difference == 0){
            title = "Perfect!"
        }
        else if(difference <= 5){
            title = "Close one"
        }
        else if(difference <= 10){
            title = "You can do better"
        }
        else{
            title = "Not even close!"
        }
        let message = "You scored \(pointsScored)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int (roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        currentRound += 1
        slider.value = Float (currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(currentRound)
    }

}

