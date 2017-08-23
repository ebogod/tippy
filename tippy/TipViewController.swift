//
//  ViewController.swift
//  tippy
//
//  Created by Ester Bogod on 8/10/17.
//  Copyright © 2017 Ester Bogod. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField! {
        didSet {
             billField.attributedPlaceholder = NSAttributedString(string: billField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        }
    }
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var valuesView: UIView!
    var canAnimate: Bool = true

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bill = Double(billField.text!) ?? 0
        valuesView.alpha = (bill == 0) ? 0 : 1
        let defaults = UserDefaults.standard
        let selection = defaults.integer(forKey: "default_tip_selection")
        tipControl.selectedSegmentIndex = selection
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {

        let bill = Double(billField.text!) ?? 0
        if canAnimate {
            UIView.animate(withDuration: 0.2, animations: {
                self.canAnimate = false
                self.valuesView.frame.origin.y -= 20.0
                self.valuesView.alpha = (bill == 0) ? 0 : 1
            })
        }
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

