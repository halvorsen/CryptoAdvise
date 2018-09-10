//
//  DateExtension.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 9/2/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

extension Date {

    func twitterString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
}
