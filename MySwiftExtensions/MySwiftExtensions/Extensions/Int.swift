//
//  Int.swift
//  MySwiftExtensions
//
//  Created by 老刁 on 2020/10/15.
//  Copyright © 2020 老刁. All rights reserved.
//

import Foundation
//MARK:-  Int转Double
extension Int {
    func toDouble() -> Double {
        Double(self)
    }
}
//MARK:-  分转元
extension Int {
    func fenToYuan() -> Double {
        Double(self) / 100
    }
}

//MARK:-  Int转String
extension Int {
    func toString() -> String {
        "\(self)"
    }
}
