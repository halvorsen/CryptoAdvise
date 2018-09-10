//
//  TwitterTimelineModel.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class TwitterTimelineModel {
    var tweets: [Tweet] = []

    func updateTweets(twitterHandle: String, completion: @escaping () -> Void) {
        tweets.removeAll()
        var count = 0
        var timeout = Timer()
        DispatchQueue.main.async {
            timeout = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { _ in
                completion()
            }
        }
        Twitter.shared.getTimeline(for: twitterHandle, result: { tweetJSON in
            if let tweets = tweetJSON.array {
                for tweet in tweets {
                    guard let user = tweet["user"].object,
                        let content = tweet["text"].string,
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
                    NetworkRequest.fetchCircleImage(imageURL: imageURL, callback: { circleImage in
                        self.tweets.append(Tweet(image: circleImage, tweeterName: tweeterName, tweeter: tweeter, tweetContent: content.removehttp(), favorited: favorited, expandedURL: expandedURL))
                        count += 1
                        if count == tweets.count {
                            timeout.invalidate()
                            completion()
                        }
                    })
                }
            }
        })
    }
}
