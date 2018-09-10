//
//  NewsHeadlineController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class NewsHeadlineController: UIController {
    
    private var mainViewController: MainViewController
    private var newsHeadlineModel: NewsHeadlineModel
    
    init(mainViewController: MainViewController, newsHeadlineModel: NewsHeadlineModel) {
        self.mainViewController = mainViewController
        self.newsHeadlineModel = newsHeadlineModel
    }
    
}

extension NewsHeadlineController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsHeadlineModel.headlines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCollectionViewCell
        guard newsHeadlineModel.headlines.count > index else { return cell }
        cell.setInterface(with: newsHeadlineModel.headlines[index])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: newsHeadlineModel.headlines[indexPath.row].articleURLString),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
