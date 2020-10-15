//
//  String.swift
//  MySwiftExtensions
//
//  Created by 老刁 on 2020/10/15.
//  Copyright © 2020 老刁. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

//MARK:-  清除空格
extension String {
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed
    }
}

//MARK:-  时间转换
extension String {
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

//MARK:-  string转坐标
extension String {
    var asCoordinates: CLLocationCoordinate2D? {
        let components = self.components(separatedBy: ",")
        if components.count != 2 { return nil }
        let strLat = components[0].trimmed
        let strLng = components[1].trimmed
        if let dLat = Double(strLat),
            let dLng = Double(strLng) {
            return CLLocationCoordinate2D(latitude: dLat, longitude: dLng)
        }
        return nil
    }
}

//MARK:-  string转URL
extension String {
    var asURL: URL? {
        URL(string: self)
    }
}

//MARK:-  String占用text宽度
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

//MARK:-  判断是否只有数字
extension String {
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
}

//MARK:-  判断只有数字和大小写字母
extension String {
    var isAlphanumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

//MARK:-  String下标操作
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start..<end]
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start...end]
    }
    
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        if end < start { return "" }
        return self[start...end]
    }
    
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex...end]
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex..<end]
    }
}

//MARK:-  Strign转字典
extension String {
    var asDict: [String: Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}

//MARK:-  String转数组
extension String {
    var asArray: [Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
    }
}

//MARK:-  String转富文本String
extension String {
    var asAttributedString: NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }
}
