//
//  LabelExtension.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit.UILabel

/// Spacing between characters, call addTextSpacing after setting label's text.
extension UILabel {
    func addTextSpacing(value: CGFloat) {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedStringKey.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

extension UITextView {
    func addTextSpacing(value: CGFloat) {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            guard text.count > 0 else { return }
            attributedString.addAttribute(NSAttributedStringKey.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
