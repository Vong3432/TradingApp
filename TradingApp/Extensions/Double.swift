//
//  Double.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.locale = .current
        
        let number = NSNumber(value: self)
        
        return formatter.string(from: number)!
    }
}
