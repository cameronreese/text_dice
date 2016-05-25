//
//  InterfaceController.swift
//  DDDice Watch App Extension
//
//  Created by Cameron Reese on 4/20/16.
//  Copyright © 2016 Camian. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var diceSelectonTable: WKInterfaceTable!

    var dice = ["d3", "d4", "d6", "d8", "d10", "d12", "d20", "d100"]
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
         self.diceSelectonTable.setNumberOfRows(self.dice.count, withRowType: "DiceSelectorRow")
        
        for index in 0..<self.dice.count {
            let diceRow = self.diceSelectonTable.rowControllerAtIndex(index) as! DiceSelectorRow
            diceRow.rowD.setText(self.dice[index])
        
        }
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("RollScreneController", context: nil)
    }
}
