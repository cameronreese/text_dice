//
//  ViewController.swift
//  DDDice
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var notBreaked = false
    
    let tickEnd = 8
    
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
        logTextBox.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func diceButtonPressed(_ sender: UIButton) {
        
        notBreaked = true
        var numberOfDiceSides: Int
        var diceRollResult = 0
        
        // determine which dice button was pressed and change numberOfDiceSides appropriately
        switch sender.titleLabel?.text {
        case .some("d3"):
            numberOfDiceSides = 3
            break
        case .some("d4"):
            numberOfDiceSides = 4
            break
        case .some("d6"):
            numberOfDiceSides = 6
            break
        case .some("d8"):
            numberOfDiceSides = 8
            break
        case .some("d10"):
            numberOfDiceSides = 10
            break
        case .some("d12"):
            numberOfDiceSides = 12
            break
        case .some("d20"):
            numberOfDiceSides = 20
            break
        case .some("d100"):
            numberOfDiceSides = 100
            break
        default:
            numberOfDiceSides = 0
        }
        
        self.currentRollDisplayLabel.text = String(Int(arc4random_uniform(UInt32(numberOfDiceSides))) + 1)
        
        var timeSlice = 0.0
        for tick in 1...tickEnd {
            
            timeSlice += Double(tick) / (Double(tickEnd) * 2.5)
            
            self.delay(timeSlice, closure: {
                DispatchQueue.main.async{
                    var temp = Int(arc4random_uniform(UInt32(numberOfDiceSides))) + 1

                    while temp == diceRollResult {
                        temp = Int(arc4random_uniform(UInt32(numberOfDiceSides))) + 1
                    }
                    diceRollResult = temp
                    
                    if tick == self.tickEnd {
                        
                        self.currentRollDisplayLabel.text = String(diceRollResult)
                        
                        self.runningSum += diceRollResult
                        
                        self.sumLabel.text = "Sum: " + String(self.runningSum)
                        
                        if let diceLabel = sender.titleLabel?.text! {
                            let currentLogText = self.logTextBox.text!
                            let newLogText = "\(diceLabel): \(diceRollResult)\n" + currentLogText
                            self.logTextBox.text = newLogText
                        }
                    }
                    else {
                        self.currentRollDisplayLabel.text = String(diceRollResult)
                    }
                    
                }
            })
            
        }
    
    }
    


    // function to clear out the log and main roll display
    @IBAction func clearLogButtonPressed(_ sender: UIButton) {
        notBreaked = false
        runningSum = 0
        currentRollDisplayLabel.text = "~"
        logTextBox.text = "--------"
        sumLabel.text = "Sum: "
    }
    
    @IBAction func addBreakInLog(_ sender: UIButton) {
        
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
    
    
    // used to delay the running main thread
    func delay(_ delay: Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
}

