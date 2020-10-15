//
//  Date.swift
//  MySwiftExtensions
//
//  Created by 老刁 on 2020/10/15.
//  Copyright © 2020 老刁. All rights reserved.
//

import Foundation
//MARK:-  Date转String
extension Date {
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}
