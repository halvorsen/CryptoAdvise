//
//  Line.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/29/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class Line: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.blackLight.withAlphaComponent(0.44)
    }
    
    func addConstraintsForBottomPositioning() {
         translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        rightAnchor.constraint(equalTo: superview!.rightAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview!.leftAnchor).isActive = true
    }
    
    func addConstraintsForTopPositioning() {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        rightAnchor.constraint(equalTo: superview!.rightAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview!.leftAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
