//
//  SplitCalculator.swift
//  Tipsy
//
//  Created by Muhammad Shayan on 27/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct SplitCalculator {
    
    var split: String?
    var tip: Double?
    var people: Int?
    var amount: Double?
    
    mutating func calculateBillSplit() {
        var billAmount = amount ?? 0.0
        guard let tip = tip, let people = people else { return }
        
        billAmount += (tip * billAmount)
        split = String(format: "%.2f", Double(billAmount) / Double(people))
    }
    
    func getSplit() -> String {
        return split ?? "None"
    }
    
    func getNumberOfPeople() -> Int {
        return people ?? 0
    }
    
    func getTip() -> Int {
        return Int((tip ?? 0.0) * 100)
    }
}
