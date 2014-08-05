//
//  ViewController.swift
//  MMHS_Tip_Calculator_App
//
//  Created by Vik Denic on 7/23/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    var tipAmount : Double!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Helper method to calculate tip
    func calculateTip()
    {
        var billAmount = NSString(string: AmountTextField.text).doubleValue
        tipAmount = billAmount * 0.15

        //Format string to display dollar signs and 2 decimal places
        var tipString = NSString(format:"$%.2f", tipAmount)

        //Set label to display string
        tipAmountLabel.text = tipString
    }

    //IBAction that detects when billAmountTextField is Edited
    @IBAction func onBillAmountTextFieldEdited(sender: AnyObject)
    {
        calculateTip()
    }

    //Resign keyboard when user taps away from textfield
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)
    {
        view.endEditing(true)
    }
}

