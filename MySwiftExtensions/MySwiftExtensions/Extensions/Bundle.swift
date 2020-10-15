//
//  Bundle.swift
//  MySwiftExtensions
//
//  Created by 老刁 on 2020/10/15.
//  Copyright © 2020 老刁. All rights reserved.
//

import Foundation


extension Bundle {
    var appVersion: String? {
        self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    static var mainAppVersion: String? {
        Bundle.main.appVersion
    }
}
