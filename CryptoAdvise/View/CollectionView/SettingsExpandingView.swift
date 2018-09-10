//
//  SettingsExpandingView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func tappedButton(with title: String)
}

final class SettingsExpandingView: UIView {
    
    private let stack = UIStackView()
    let title = UITextView()
    private let body = UITextView()
    private let identifier: String
    weak var delegate: SettingsDelegate?
    
    init(titleText: String, bodyText: String, delegate: SettingsDelegate?) {
        identifier = titleText
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 10
        addSubview(stack)
        
        title.text = titleText.uppercased()
        title.textContainerInset = UIEdgeInsets(top: 14, left: 20, bottom: 14, right: 0)
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        title.textAlignment = .left
        title.isScrollEnabled = false
        title.isEditable = false
        title.isSelectable = false
        title.isUserInteractionEnabled = true
        title.addTextSpacing(value: 2.2)
        stack.addArrangedSubview(title)
        
        body.textContainerInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        body.textAlignment = .left
        body.isScrollEnabled = false
        body.isUserInteractionEnabled = true
        body.isEditable = false
        body.isSelectable = false
        body.attributedText = Format(bodyText: bodyText).attributeString()

        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupAndActivateContraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    internal func toggleContent() {
        delegate?.tappedButton(with: identifier)
        if body.isDescendant(of: stack) {
            body.removeFromSuperview()

        } else {
            stack.addArrangedSubview(body)
            body.translatesAutoresizingMaskIntoConstraints = false
            body.widthAnchor.constraint(equalToConstant: 0.7*UIScreen.main.bounds.width - 20).isActive = true
            body.layoutIfNeeded()
        }
    }
}

internal struct Format {
    
    var bodyText: String
    var style = NSMutableParagraphStyle()
    var attributes: [NSAttributedStringKey: Any]
    
    init(bodyText: String) {
        self.bodyText = bodyText
        attributes = [
            NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 10) ?? UIFont(),
            NSAttributedStringKey.paragraphStyle: style,
            NSAttributedStringKey.foregroundColor: AppColor.blackDark,
            NSAttributedStringKey.kern: 1.7
        ]
        style.lineSpacing = 4
        style.paragraphSpacingBefore = 6
        style.paragraphSpacing = 6
    }
    
    func attributeString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: self.bodyText + "\n", attributes: attributes))
        return attributedString as NSAttributedString
    }
    
    
}
