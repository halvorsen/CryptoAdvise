//
//  BaseCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, collectionViewLayout: UICollectionViewFlowLayout? = nil, frame: CGRect = CGRect.zero) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = CGSize(width: 375*UIScreen.main.bounds.width/375, height: 255)
        super.init(frame: frame, collectionViewLayout: collectionViewLayout ?? layout)
        
        showsVerticalScrollIndicator = false
        backgroundColor = AppColor.white
        bounces = true
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
