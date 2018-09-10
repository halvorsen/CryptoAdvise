//
//  TwitterCollectionController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
// these controllers for now, unless the app gets bigger stay around the entire life of app, if app gets bigger need to make some of the properties in these controllers "weak"
typealias UIController = NSObject
final class TwitterTimelineController: UIController {
    
    private let mainViewController: MainViewController
    private let twitterTimelineModel: TwitterTimelineModel
    private var tweets: [Tweet] = []
    
    init(mainViewController: MainViewController, twitterTimelineModel: TwitterTimelineModel) {
        self.mainViewController = mainViewController
        self.twitterTimelineModel = twitterTimelineModel
    }
}

extension TwitterTimelineController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return twitterTimelineModel.tweets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "twitterCell", for: indexPath) as! TwitterCollectionViewCell
        guard twitterTimelineModel.tweets.count > index else { return cell }
        let tweet = twitterTimelineModel.tweets[index]
        cell.setInterface(with: tweet.image, tweeterName: tweet.tweeterName, tweeter: tweet.tweeter, tweetContent: tweet.tweetContent)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: twitterTimelineModel.tweets[indexPath.row].expandedURL),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
