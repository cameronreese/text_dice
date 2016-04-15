//
//  ViewController.swift
//  DDDice
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var notBreaked = false
    
    var runningSum = 0
    
    @IBOutlet weak var currentRollDisplayLabel: UILabel!

    @IBOutlet weak var diceButton: UIButton!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var logTextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentRollDisplayLabel.text = "~"
        logTextBox.text = "--------"
        logTextBox.editable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func diceButtonPressed(sender: UIButton) {
        
        notBreaked = true
        
        var numberOfDiceSides: Int
        
        // determine which dice button was pressed and change numberOfDiceSides appropriately
        if (sender.titleLabel?.text == "d3") {
            numberOfDiceSides = 3 }
        else if (sender.titleLabel?.text == "d4") {
            numberOfDiceSides = 4 }
        else if (sender.titleLabel?.text == "d6") {
            numberOfDiceSides = 6 }
        else if (sender.titleLabel?.text == "d8") {
            numberOfDiceSides = 8 }
        else if (sender.titleLabel?.text == "d10") {
            numberOfDiceSides = 10 }
        else if (sender.titleLabel?.text == "d12") {
            numberOfDiceSides = 12 }
        else if (sender.titleLabel?.text == "d20") {
            numberOfDiceSides = 20 }
        else if (sender.titleLabel?.text == "d100") {
            numberOfDiceSides = 100 }
        else {
            numberOfDiceSides = 0 }
        
        // find a random number based on number of sides
        let diceRollResult = Int(arc4random_uniform(UInt32(numberOfDiceSides))) + 1
        
        spinTheWheel(numberOfDiceSides)
        
        currentRollDisplayLabel.text = String(diceRollResult)
        
        runningSum += diceRollResult
        
        sumLabel.text = "Sum: " + String(runningSum)
        
        
        if let diceLabel = sender.titleLabel?.text! {
            let currentLogText = logTextBox.text!
            let newLogText = "\(diceLabel): \(diceRollResult)\n" + currentLogText
            logTextBox.text = newLogText
        }
        
        
    }
    

    // function to clear out the log and main roll display
    @IBAction func clearLogButtonPressed(sender: UIButton) {
        notBreaked = false
        runningSum = 0
        currentRollDisplayLabel.text = "~"
        logTextBox.text = "--------"
        sumLabel.text = "Sum: "

    }
    
    @IBAction func addBreakInLog(sender: UIButton) {
        
        runningSum = 0
        
        let currentLogText = logTextBox.text!
        if notBreaked {
            let newLogText = "--------\n" + currentLogText
            logTextBox.text = newLogText
            notBreaked = false
        }
        sumLabel.text = "Sum: "
        
        currentRollDisplayLabel.text = "~"
    }
    
    // function that randomly displays numbers from fast to slow
    func spinTheWheel(max: Int) {
        var timeSlice = 1.0
        for tick in 1...10 {
            
            timeSlice = pow(2.0, Double(tick))
            
            delay(timeSlice / pow(2.0, 10.0)) {
                dispatch_async(dispatch_get_main_queue()){
                    self.currentRollDisplayLabel.text = String(Int(arc4random_uniform(UInt32(max))) + 1)
                }
            }
        }
    }
    
    func delay(delay: Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}

