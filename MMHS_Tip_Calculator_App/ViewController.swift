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

    var tipPercent : Double = 0.15
    var tipAmount : Double = 0.0

    var splitCount = 1

    @IBOutlet weak var splitLabel: UILabel!

    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var twentyFiveButton: UIButton!

    @IBOutlet weak var totalBillLabel: UILabel!

    @IBOutlet weak var verticalHeight: NSLayoutConstraint!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        splitLabel.text = "\(splitCount)"
        fifteenButton .setImage(UIImage(named: "15_selected_image"), forState: .Normal)

        if self.view.frame.size.height == 568
        {
            verticalHeight.constant = 30
        }
    }

    //Helper method to calculate tip
    func calculateTip()
    {
        var billAmount = NSString(string: billAmountTextField.text).doubleValue
        tipAmount = billAmount * tipPercent / Double(splitCount)

        //Format string to display dollar signs and 2 decimal places
        var tipString = NSString(format:"$%.2f", tipAmount)

        //Set label to display string
        tipAmountLabel.text = tipString

        //set total bill
        var totalBill = tipAmount * Double(splitCount) + billAmount
        totalBillLabel.text = NSString(format:"Total: $%.2f", totalBill)

        animateTotalBillLabel()
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

    //button actions
    @IBAction func onTenButtonPressed(sender: UIButton)
    {
        resetAllButtons()
        tenButton .setImage(UIImage(named: "10_selected_image"), forState: .Normal)
        tipPercent = 0.10
        calculateTip()
    }

    @IBAction func onFifteenButtonPressed(sender: UIButton)
    {
        resetAllButtons()
        fifteenButton .setImage(UIImage(named: "15_selected_image"), forState: .Normal)
        tipPercent = 0.15
        calculateTip()
    }

    @IBAction func onTwentyButtonPressed(sender: UIButton)
    {
        resetAllButtons()
        twentyButton .setImage(UIImage(named: "20_selected_image"), forState: .Normal)
        tipPercent = 0.20
        calculateTip()
    }

    @IBAction func onTwentyFiveButtonPressed(sender: UIButton)
    {
        resetAllButtons()
        twentyFiveButton .setImage(UIImage(named: "25_selected_image"), forState: .Normal)
        tipPercent = 0.25
        calculateTip()
    }

    //helper method that resets all buttons to unselected image
    func resetAllButtons()
    {
        tenButton .setImage(UIImage(named: "10_unselected_image"), forState: .Normal)
        fifteenButton .setImage(UIImage(named: "15_unselected_image"), forState: .Normal)
        twentyButton .setImage(UIImage(named: "20_unselected_image"), forState: .Normal)
        twentyFiveButton .setImage(UIImage(named: "25_unselected_image"), forState: .Normal)
    }

    //splitting up the tip
    @IBAction func onDownPressed(sender: UIButton)
    {
        if splitCount > 1
        {
            splitCount--
            splitLabel.text = "\(splitCount)"
            calculateTip()
        }
    }

    @IBAction func onUpPressed(sender: UIButton)
    {
        if splitCount > 0
        {
            splitCount++
            splitLabel.text = "\(splitCount)"
            calculateTip()
        }
    }

    //animate the label
    func animateTotalBillLabel()
    {
        totalBillLabel.alpha = 0
        UIView.animateWithDuration(1, animations: {
            self.totalBillLabel.alpha = 1
            })
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
            return UIStatusBarStyle.LightContent;
    }

}

