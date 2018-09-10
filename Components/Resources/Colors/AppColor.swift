//
//  AppColor.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit.UIColor

/// mapping of UIColors to abstracted list of colors in application
struct AppColor {
    
    static let white = UIColor.white
    static let blackDark = UIColor.init(red: 44/255, green: 44/255, blue: 44/255, alpha: 1.0)
    static let blackMedium = UIColor.init(red: 76/255, green: 76/255, blue: 76/255, alpha: 1.0)
    static let blackLight = UIColor.init(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
    
    static let pageIndicatorBackground = UIColor.init(red: 44/255, green: 44/255, blue: 44/255, alpha: 0.27)
    static let pageIndicatorDot = UIColor.init(red: 44/255, green: 44/255, blue: 44/255, alpha: 0.20)
    
    static let menutext = UIColor.white.withAlphaComponent(0.76)
}
