//
//  ViewController.swift
//  goracing
//
//  Created by Гость on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var semaforLable: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        if stateSemafor == 2 {
            prCar.center.x += 10
        }
        if prCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "You lose!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
        
    }
   
    @objc func intervalTimer() {
        stateSemafor += 1
        
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        switch stateSemafor {
        case 1:
            semaforLable.text = "STOP"
            semaforLable.textColor = .red
        case 2:
            semaforLable.text = "DRIVE"
            semaforLable.textColor = .green
        default:
            break
        }
    }
    @IBAction func startGame(_ sender: UIButton) {
        semaforLable.isHidden = false
        
        timerGame =
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func driveGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            userCar.center.x += 10
        }
        else
        if stateSemafor == 1 {
            userCar.center.x -= 10
        }
        if userCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "You win!"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

