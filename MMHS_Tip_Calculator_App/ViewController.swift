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

    var tipPercent : Double!
    var tipAmount : Double!

    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var twentyFiveButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tipPercent = 0.15
    }

    //Helper method to calculate tip
    func calculateTip()
    {
        var billAmount = billAmountTextField.text.bridgeToObjectiveC().doubleValue
        tipAmount = billAmount * tipPercent

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

    //button actions
    @IBAction func onTenButtonPressed(sender: UIButton)
    {
//        resetAllButtons()
     tenButton.imageView.image = UIImage(named: "10_selected_image")
        tipPercent = 0.10
        calculateTip()
    }

    @IBAction func onFifteenButtonPressed(sender: UIButton)
    {
//        resetAllButtons()
        fifteenButton.imageView.image = UIImage(named: "15_selected_image")
        tipPercent = 0.15
        calculateTip()
    }

    @IBAction func onTwentyButtonPressed(sender: UIButton)
    {
//        resetAllButtons()
        twentyButton.imageView.image = UIImage(named: "20_selected_image")
        tipPercent = 0.20
        calculateTip()
    }

    @IBAction func onTwentyFiveButtonPressed(sender: UIButton)
    {
//        resetAllButtons()
        twentyFiveButton.imageView.image = UIImage(named: "25_selected_image")
        tipPercent = 0.25
        calculateTip()
    }

//    //helper method that resets all buttons to unselected image
//    func resetAllButtons()
//    {
//        tenButton.imageView.image = UIImage(named: "ten_unselected_image")
//        fifteenButton.imageView.image = UIImage(named: "fifteen_unselected_image")
//        twentyButton.imageView.image = UIImage(named: "twenty_unselected_image")
//        twentyFiveButton.imageView.image = UIImage(named: "twentyFive_unselected_image")
//    }
}

