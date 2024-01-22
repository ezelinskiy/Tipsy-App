//
//  BillBrainModel.swift
//  Tipsy-App
//
//  Created by Evgeniy Zelinskiy on 22.01.2024.
//

import Foundation

struct BillBrainModel {
    var billModel: BillModel?
    
    mutating func calculateTotalPerPersoneWith(total: Double, tip: Double, split: Double) {
        let totalPerPersone = (total + (total * tip)) / split
        billModel = BillModel(totalPerPersone: totalPerPersone, tip: tip, split: split)
    }
    
    func getTotalPerPersone() -> String {
        String(format: "%.2f", billModel?.totalPerPersone ?? 0.0)
    }
    
    func getSettings() -> String {
        let splitCount = Int(billModel?.split ?? 0)
        let tipValue = Int((billModel?.tip ?? 0) * 100)
        return "Split between \(splitCount) people, with \(tipValue)% tip."
    }
}
