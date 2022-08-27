//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class BillCalculationViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var splitCalculator = SplitCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        
        let title = sender.currentTitle ?? ""
        let number = String(title.dropLast())
        splitCalculator.tip = (Double(number) ?? 0.0) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        splitNumberLabel.text = String(stepperValue)
        splitCalculator.people = stepperValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        splitCalculator.amount = Double(billTextField.text ?? "")
        splitCalculator.calculateBillSplit()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as? ResultsViewController
            resultVC?.split = splitCalculator.getSplit()
            resultVC?.tip = splitCalculator.getTip()
            resultVC?.people = splitCalculator.getNumberOfPeople()
        }
    }
}

