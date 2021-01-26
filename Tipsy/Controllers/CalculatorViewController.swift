//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billInputView: UITextField!
    
    @IBOutlet weak var splitCounterView: UILabel!
    
    @IBOutlet weak var zeroPercentTipBtn: UIButton!
    
    @IBOutlet weak var tenPercentTipBtn: UIButton!
    
    @IBOutlet weak var twentyPercentTipBtn: UIButton!
    
    var selectedTip: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTipUI () {
        zeroPercentTipBtn.isSelected = selectedTip == zeroPercentTipBtn.accessibilityIdentifier;
        
        tenPercentTipBtn.isSelected = selectedTip == tenPercentTipBtn.accessibilityIdentifier;
        
        twentyPercentTipBtn.isSelected = selectedTip == twentyPercentTipBtn.accessibilityIdentifier;
    }

    @IBAction func onTipButtonTap(_ sender: UIButton) {
        selectedTip = sender.accessibilityIdentifier;
        
        updateTipUI();
    }
    
    @IBAction func onSplitCountChange(_ sender: UIStepper) {
    }
    
    @IBAction func onCalculateButtonClick(_ sender: UIButton) {
    }
}

