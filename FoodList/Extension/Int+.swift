//
//  Int+.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Foundation
extension Int{
    func toString() -> String{
        return String(self) ?? "0"
    }
    
    func toFormat(_ symbol :String = "฿")->String{
        let format = NumberFormatter()
        format.usesGroupingSeparator = true
        format.currencySymbol = ""
        format.numberStyle = .currency
        format.locale = Locale.current
        format.maximumFractionDigits = 0
        let text =  format.string(from: NSNumber(value: self))
        return "\((text ?? self.toString())) \(symbol)"
    }
}
