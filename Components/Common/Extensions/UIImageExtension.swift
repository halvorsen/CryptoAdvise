//
//  UIImageExtension.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    // UI performance improvement, allows for offscreen rendering of images
    func offscreenRenderedCircularImage() -> UIImage? {
        let rect = CGRect(origin: CGPoint.zero, size: CGSize(width: 70, height: 70))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.addEllipse(in: rect)
        currentContext?.clip()
        currentContext?.translateBy(x: 0, y: rect.origin.y + rect.size.height)
        currentContext?.scaleBy(x: 1.0, y: -1.0)
        currentContext?.draw(self.cgImage!, in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
