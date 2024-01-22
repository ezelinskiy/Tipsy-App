//
//  CalculateViewController.swift
//  Tipsy-App
//
//  Created by Evgeniy Zelinskiy on 22.01.2024.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var totalBillTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctNumber: UIButton!
    @IBOutlet weak var splitNumberValue: UILabel!
    
    var billBrain = BillBrainModel()
    var splitValue: Double = 2.0
    var tipValue: Double = 0.1

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        totalBillTextField.endEditing(true)
        splitValue = sender.value
        splitNumberValue.text = String(format: "%.0f", splitValue)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        totalBillTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctNumber.isSelected = false
        sender.isSelected = true
        if sender .isEqual(zeroPctButton) {
            tipValue = 0.0
        } else if sender .isEqual(tenPctButton) {
            tipValue = 0.1
        } else if sender .isEqual(twentyPctNumber) {
            tipValue = 0.2
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBillTextField.endEditing(true)
        if let unwparedTotalBillText = totalBillTextField.text {
            if !unwparedTotalBillText.isEmpty && Double(unwparedTotalBillText) != nil {
                billBrain.calculateTotalPerPersoneWith(total: Double(unwparedTotalBillText)!, tip: tipValue, split: splitValue)
                self.performSegue(withIdentifier: "showResult", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalValue = billBrain.getTotalPerPersone()
            destinationVC.settingsValue = billBrain.getSettings()
        }
    }
}

