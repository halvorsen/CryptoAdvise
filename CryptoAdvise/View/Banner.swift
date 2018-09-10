//
//  Banner.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

enum DisplaySection {
    case graph, coin, hashtag, news, link
}

final class Banner: UIView {
    
    let coin = UIButton()
    let settings = UIButton()
    private let price = UILabel()
    private let symbol = UIImageView()
    private let line = Line()
    
    func setCoin(text: String) {
        coin.setTitle(text, for: .normal)
    }
    
    func setCoinPrice(text: String) {
        price.text = "$" + text
        price.addTextSpacing(value: 2.2)
    }
    
    func setSymbol(for display: DisplaySection) {
        
        switch display {
        case .graph:
            symbol.image = #imageLiteral(resourceName: "graphIcon")
        case .coin:
            symbol.image = #imageLiteral(resourceName: "atSymbolIcon")
        case .hashtag:
            symbol.image = #imageLiteral(resourceName: "hashtagIcon")
        case .news:
            symbol.image = #imageLiteral(resourceName: "newsIcon")
        case .link:
            symbol.image = #imageLiteral(resourceName: "linkIcon")
        }
        
    }

    init() {
        super.init(frame: CGRect.zero)
        
        backgroundColor = AppColor.white
        
        let headerFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
        let headerTextColor = AppColor.blackDark
        coin.titleLabel?.font = headerFont
        coin.setTitleColor(headerTextColor, for: .normal)
        coin.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        setCoin(text: "BTC")
        addSubview(coin)
        
        price.font = headerFont
        price.textColor = headerTextColor
        setCoinPrice(text: "11000")
        addSubview(price)
        
        settings.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        addSubview(settings)
        
        setSymbol(for: .coin)
        addSubview(symbol)
        addSubview(line)
        
        setupAndActivateContraints()
    }
    
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [coin, settings, price, symbol]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        coin.leftAnchor.constraint(equalTo: symbol.rightAnchor).isActive = true
        coin.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        price.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        price.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        settings.centerXAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        settings.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        symbol.rightAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        symbol.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        line.addConstraintsForBottomPositioning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
