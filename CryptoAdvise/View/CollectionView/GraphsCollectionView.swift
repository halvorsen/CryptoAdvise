//
//  GraphsCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class GraphsCollectionView: BaseCollectionView {
    
   init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        super.init(dataSource: dataSource, delegate: delegate)
        register(GraphsCollectionViewCell.self, forCellWithReuseIdentifier: "graphCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
