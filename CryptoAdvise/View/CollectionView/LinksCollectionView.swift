//
//  LinksCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class LinksCollectionView: BaseCollectionView {
    
    init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        super.init(dataSource: dataSource, delegate: delegate)
        register(LinksCollectionViewCell.self, forCellWithReuseIdentifier: "linkCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
