//
//  BaseCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let line = Line()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        addSubview(line)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        line.addConstraintsForBottomPositioning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
