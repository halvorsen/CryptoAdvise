//
//  File.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class NewsHeadlineModel {
   var headlines: [Headline] = []
    
    func updateHeadlines(coin: Crypto, completion: @escaping () -> Void) {
        headlines.removeAll()
        var timeout = Timer()
        DispatchQueue.main.async {
            timeout = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { _ in
                completion()
            }
        }
        
        func isNotPaidForArticle(content: String) -> Bool {
            return content.range(of: "submitted") == nil
        }
        
        GoogleNews.getArticles(for: coin.rawValue) { json in
            var count = 0
            if let jsonArray = json,
                let array = jsonArray as? [String: Any],
                let articles = array["articles"] as? [[String: Any]] {
                for article in articles {
                
                    if let source = article["source"] as? [String: String],
                        let newsSource = source["name"],
                        let imageURL = article["urlToImage"] as? String,
                        let headline = article["title"] as? String,
                        let content = article["description"] as? String,
                        let articleURL = article["url"] as? String,
                        let author = article["author"] as? String {
                        
                        NetworkRequest.fetchCircleImage(imageURL: imageURL) { image in
                            if isNotPaidForArticle(content: content) {
                                self.headlines.append(Headline(image: image, newsSource: newsSource, headline: headline, content: content, author: author, articleURLString: articleURL))
                            }
                            count += 1
                            if count == articles.count {
                                timeout.invalidate()
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
}
