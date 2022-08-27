//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Muhammad Shayan on 27/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var split: String = ""
    var tip = 0
    var people = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = split
        settingsLabel.text = "Split between \(people) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
