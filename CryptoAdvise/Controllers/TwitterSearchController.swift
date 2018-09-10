//
//  TwitterSearchController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class TwitterSearchController: UIController {
    
    private var mainViewController: MainViewController
    private var twitterSearchModel: TwitterSearchModel

    init(mainViewController: MainViewController, twitterSearchModel: TwitterSearchModel) {
        self.mainViewController = mainViewController
        self.twitterSearchModel = twitterSearchModel
    }
    
}

extension TwitterSearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return twitterSearchModel.tweetsSorted.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "twitterCell", for: indexPath) as! TwitterCollectionViewCell
        guard twitterSearchModel.tweetsSorted.count > index else { return cell }
        let tweet = twitterSearchModel.tweetsSorted[index]
        cell.setInterface(with: tweet.image, tweeterName: tweet.tweeterName, tweeter: tweet.tweeter, tweetContent: tweet.tweetContent)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: twitterSearchModel.tweetsSorted[indexPath.row].expandedURL),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
