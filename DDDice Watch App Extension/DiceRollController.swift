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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        var diceType = context as! String
        
        self.diceRollLabel.setText(diceType)
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
