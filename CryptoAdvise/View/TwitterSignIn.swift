//
//  TwitterSignIn.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/23/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class TwitterSignIn: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Twitter Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.setTitleColor(AppColor.blackDark, for: .normal)
        button.layer.borderColor = AppColor.blackDark.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 25
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        addSubview(button)
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAndActivateContraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.3, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
