//
//  ViewController.swift
//  Stere iOS Test App
//
//  Created by Joshua Fehler on 2018-11-01.
//  Copyright © 2018 Joshua Fehler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var timer: Timer?
    
    // MARK: Properties
    @IBOutlet weak var buildGearButton: UIButton!
    
    @IBOutlet weak var buildRobotButton: UIButton!
    
    @IBOutlet weak var gearAmountLabel:
        UILabel!
    
    @IBOutlet weak var robotAmountLabel:
        UILabel!
    
    @IBOutlet weak var robotAmountInput:
        UITextField!
    
    var gearsAmount = 0
    var desiredRobots = 0
    var robotsAmount = 0
    
    @objc func autoBuildGears() {
        gearsAmount += 1
        changeNumberLabel(gearsAmount)
    }
    
    func changeNumberLabel(_ newValue: Int) {
        gearAmountLabel.text = "Number of Gears: " + String(newValue)
    }
    
    @IBAction func buildGear(_ sender: UIButton) {
        gearsAmount += 1
        changeNumberLabel(gearsAmount)
    }
    
    @IBAction func buildRobots(_ sender: UIButton) {
        let desiredRobots:Int? = Int(robotAmountInput.text!)
        let cost:Int? = desiredRobots! * 10
    
        // Remove gears, add robot
        if (gearsAmount >= cost!) && (cost != 0) {
            gearsAmount -= cost!
            robotsAmount += 1
            robotAmountLabel.text = "Number of Robots: " + String(robotsAmount)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(autoBuildGears), userInfo: nil, repeats: true)
        }
        
        changeNumberLabel(gearsAmount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

