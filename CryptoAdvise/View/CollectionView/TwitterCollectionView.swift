//
//  TwitterCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class TwitterCollectionView: BaseCollectionView {

    init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        super.init(dataSource: dataSource, delegate: delegate)
        register(TwitterCollectionViewCell.self, forCellWithReuseIdentifier: "twitterCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
