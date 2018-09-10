//
//  ListCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let coinLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.load()
        }
    }
    
    private func load() {
        addSubview(containerView)
        
        coinLabel.textColor = AppColor.white.withAlphaComponent(0.75)
        coinLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        
        containerView.addSubview(coinLabel)
        
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInterface(coin: String) {
        coinLabel.text = "#" + coin
        coinLabel.addTextSpacing(value: 2.2)
    }
    
   private func setupAndActivateContraints() {
        let subviews: [UIView] = [containerView, coinLabel]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.86).isActive = true
        
        coinLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        coinLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
}
