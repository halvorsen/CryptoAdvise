//
//  TwitterModel.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class TwitterSearchModel {
    private var tweets: [Tweet] = []
    var tweetsSorted: [Tweet] = []
    func sortTweets() {
        tweetsSorted = tweets.sorted { $0.favorited > $1.favorited }
    }
    func updateTweets(coin: Crypto, completion: @escaping () -> Void) {
        tweets.removeAll()
        var timeout = Timer()
        DispatchQueue.main.async {
            timeout = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { _ in
                completion()
            }
        }
        var countFetch = 0
        let fetchTotal = 10
        
        func search(maxId: String?) {
            var minID = ""
            var imagesRequestedCount = 0
            let fullSearchTerm = "#" + coin.rawValue + " OR $" + coin.rawValue
            Twitter.shared.search(for: fullSearchTerm, maxID: maxId, result: { tweetJSON, responseStatsJSON in
                var count = 0
                if let tweets = tweetJSON.array {
                    for tweet in tweets {
                        //parse tweets
                        guard let user = tweet["user"].object,
                            let content = tweet["text"].string,
                            let tweetID = tweet["id_str"].string,
                            let favorited = tweet["favorite_count"].double,
                            let tweeter = user["screen_name"]?.string,
                            let tweeterName = user["name"]?.string,
                            let imageURL = user["profile_image_url_https"]?.string,
                            let entities = tweet["entities"].object else {print("guarded user object"); return }
                        var expandedURL = ""
                        if let (_, value) = entities.first,
                            let url = value[0]["expanded_url"].string {
                            print(expandedURL)
                            expandedURL = url
                        }
                        //twitter search api accepts a minID argument to receive next page of tweets, the idea is to get a block of tweets older than the minID of the previous block
                        minID = minID == "" ? tweetID : (Int(minID)! > Int(tweetID)! ? tweetID : minID )
                        if favorited > 0 {
                            imagesRequestedCount += 1
                            NetworkRequest.fetchCircleImage(imageURL: imageURL, callback: { circleImage in
                                // store tweets
                                self.tweets.append(Tweet(image: circleImage, tweeterName: tweeterName, tweeter: tweeter, tweetContent: content.removehttp(), favorited: favorited, expandedURL: expandedURL))
                                count += 1
                                if count == imagesRequestedCount && countFetch == fetchTotal {
                                    timeout.invalidate()
                                    completion()
                                }
                            })
                        }
                    }
                }
                countFetch += 1
                if countFetch != fetchTotal {
                    //recursive
                    search(maxId: String(Int(minID)! - 1))
                }
            })
        }
        search(maxId: nil)
    }
    
}
