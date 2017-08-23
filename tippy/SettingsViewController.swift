//
//  SettingsViewController.swift
//  tippy
//
//  Created by Ester Bogod on 8/14/17.
//  Copyright © 2017 Ester Bogod. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let selection = defaults.integer(forKey: Keys.defaultTipKey)
        defaultTipControl.selectedSegmentIndex = selection
    }

    @IBAction func tipDefaultChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: Keys.defaultTipKey)
        defaults.synchronize()
    }
    
}
