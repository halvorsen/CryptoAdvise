//
//  LinksCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class LinksCollectionViewCell: BaseCollectionViewCell {
    
    private let link = UILabel()
    private var url: URL?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.load()
        }
    }
    
    private func load() {
        link.numberOfLines = 1
        link.textColor = AppColor.blackDark
        link.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        
        containerView.addSubview(link)
        
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInterface(link: Link) {
        DispatchQueue.main.async {
            self.link.text = link.name.capitalized
            self.link.addTextSpacing(value: 1.4)
            self.url = link.url
        }
    }
    
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [link]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        link.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        link.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        link.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
}
