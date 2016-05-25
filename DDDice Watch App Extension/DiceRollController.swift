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
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        self.diceRollLabel.setText("dice type selected")
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
