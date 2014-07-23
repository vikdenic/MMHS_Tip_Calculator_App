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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //Delegate Method
    @IBAction func onBillAmountTextFieldEdited(sender: AnyObject)
    {
        
    }

}

