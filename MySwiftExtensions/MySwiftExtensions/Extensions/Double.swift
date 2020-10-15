//
//  Double.swift
//  MySwiftExtensions
//
//  Created by 老刁 on 2020/10/15.
//  Copyright © 2020 老刁. All rights reserved.
//

import Foundation
//MARK:-  Double转Int
extension Double {
    func toInt() -> Int {
        Int(self)
    }
}


//MARK:-  Double转String
extension Double {
    func toString() -> String {
        String(format: "%.02f", self)
    }
}


//MARK:-  double转金额格式
extension Double {
    func toPrice(currency: String) -> String {
        let nf = NumberFormatter()
        nf.decimalSeparator = ","
        nf.groupingSeparator = "."
        nf.groupingSize = 3
        nf.usesGroupingSeparator = true
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return (nf.string(from: NSNumber(value: self)) ?? "?") + currency
    }
}
