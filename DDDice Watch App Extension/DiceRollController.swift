//
//  DiceRollController.swift
//  DDDice
//
//  Created by Cameron Reese on 5/23/16.
//  Copyright © 2016 Camian. All rights reserved.
//

import WatchKit
import Foundation


class DiceRollController: WKInterfaceController {
    
    @IBOutlet var diceRollLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        let diceType = context as! String
        
        let font = UIFont.systemFont(ofSize: 90)
        let specialString = NSAttributedString(string: diceType, attributes: [NSFontAttributeName:font])
        self.diceRollLabel.setAttributedText(specialString)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user

        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
