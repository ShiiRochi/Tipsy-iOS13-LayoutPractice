//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Денис Богданенко on 26.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalPerPersonView: UILabel!
    
    @IBOutlet weak var hintLabelView: UILabel!
    
    var bilPerPerson: Double = 0.0;
    
    var peopleCount: Double = 0;
    
    var tip: Double = 0.0;
    
    var tmpl = "Split between $PEOPLE$ people, with $TIP$ tip.";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPerPersonView.text = String(format: "%.2f", bilPerPerson)
        hintLabelView.text = tmpl.replacingOccurrences(of: "$PEOPLE$", with: String(format: "%.0f", peopleCount)).replacingOccurrences(of: "$TIP$", with: "\(String(format: "%.0f", tip * 100))%")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onRecalculateClick(_ sender: Any) {
        dismiss(animated: true);
    }
    
}
