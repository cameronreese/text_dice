//
//  ViewController.swift
//  DDDice
//
//  Created by Cameron Reese on 1/14/15.
//  Copyright (c) 2015 Camian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var currentRollDisplayLabel: UILabel!

    @IBOutlet weak var diceButton: UIButton!
    
    @IBOutlet var logScrollView: UIScrollView!
    
    @IBOutlet weak var logView: UIView!
    
    @IBOutlet weak var logLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentRollDisplayLabel.text = ""
        logLabel.text = "------------"
        logLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func diceButtonPressed(sender: UIButton) {
        
        var numberOfDiceSides: Int
        
        // determine which dice button was pressed and change numberOfDiceSides appropriately
        if (sender.titleLabel?.text == "D3") {
            numberOfDiceSides = 3 }
        else if (sender.titleLabel?.text == "D4") {
            numberOfDiceSides = 4 }
        else if (sender.titleLabel?.text == "D6") {
            numberOfDiceSides = 6 }
        else if (sender.titleLabel?.text == "D8") {
            numberOfDiceSides = 8 }
        else if (sender.titleLabel?.text == "D10") {
            numberOfDiceSides = 10 }
        else if (sender.titleLabel?.text == "D12") {
            numberOfDiceSides = 12 }
        else if (sender.titleLabel?.text == "D20") {
            numberOfDiceSides = 20 }
        else if (sender.titleLabel?.text == "D100") {
            numberOfDiceSides = 100 }
        else {
            numberOfDiceSides = 0 }
        
        // find a random number based on number of sides
        var diceRollResult = Int(arc4random_uniform(UInt32(numberOfDiceSides))) + 1

        currentRollDisplayLabel.text = String(diceRollResult)
        
        // add line to log and input new results to the top
        //logLabel.numberOfLines++
        if let diceLabel = sender.titleLabel?.text! {
            //print("\(diceLabel): \(diceRollResult)\n" + logLabel.text!)
            var currentLogText = logLabel.text!
            let newLogText = "\(diceLabel): \(diceRollResult)\n" + currentLogText
            logLabel.text = newLogText
            logLabel.sizeToFit()
        }
        
    }
    
    @IBAction func clearLogButtonPressed(sender: UIButton) {
        currentRollDisplayLabel.text = "~"
        logLabel.text = "------------"
        logLabel.sizeToFit()
       // logLabel.numberOfLines = 0
        
    }

}

