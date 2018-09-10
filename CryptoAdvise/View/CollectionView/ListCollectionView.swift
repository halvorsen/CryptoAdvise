//
//  ListCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class ListCollectionView: BaseCollectionView {

    init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = CGSize(width: 322*UIScreen.main.bounds.width/375, height: 40)
        super.init(dataSource: dataSource, delegate: delegate, collectionViewLayout: layout)
        backgroundColor = AppColor.blackDark
        contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
        register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "listCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
