//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billInputView: UITextField!
    
    @IBOutlet weak var splitCounterView: UILabel!
    
    @IBOutlet weak var zeroPercentTipBtn: UIButton!
    
    @IBOutlet weak var tenPercentTipBtn: UIButton!
    
    @IBOutlet weak var twentyPercentTipBtn: UIButton!
    
    @IBOutlet weak var stepperView: UIStepper!
    
    var selectedTip: String? = "zero"

    var percentageByTip: [String: Double] = [
        "zero": 0.0,
        "ten": 0.1,
        "twenty": 0.2
    ];
    
    var splitCounter: Double = 2;
    
    var totalBill: Double = 0.0;

    func updateTipUI () {
        zeroPercentTipBtn.isSelected = selectedTip == zeroPercentTipBtn.accessibilityIdentifier;
        
        tenPercentTipBtn.isSelected = selectedTip == tenPercentTipBtn.accessibilityIdentifier;
        
        twentyPercentTipBtn.isSelected = selectedTip == twentyPercentTipBtn.accessibilityIdentifier;
    }

    @IBAction func onTipButtonTap(_ sender: UIButton) {
        selectedTip = sender.accessibilityIdentifier;
        
        billInputView.endEditing(true);
        
        updateTipUI();
    }
    
    @IBAction func onBillChanged(_ sender: UITextField) {
        let value: String = sender.text!;
        
        if value != "" {
            // in Russia comma is used to distinct decimals
            // TODO: find a way to make it international
            totalBill = Double(value.replacingOccurrences(of: ",", with: "."))!;
        } else {
            totalBill = 0.0;
        }
    }
    
    @IBAction func onSplitCountChange(_ sender: UIStepper) {
        splitCounterView.text = String(format: "%.0f", sender.value);
        splitCounter = sender.value;
    }
    
    @IBAction func onCalculateButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResults", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResults") {
            let tipPercentage = percentageByTip[selectedTip ?? "zero"]!;
            
            let billPerPerson = (totalBill * (1 + tipPercentage)) / splitCounter;
            
            let destinationVC = segue.destination as! ResultsViewController;
            
            destinationVC.peopleCount = splitCounter;
            
            destinationVC.tip = tipPercentage;
            
            destinationVC.bilPerPerson = billPerPerson;
        }
    }
}

