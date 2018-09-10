//
//  GoogleNews.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/17/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

/// Network requests to News API
struct GoogleNews {
    // doesn't get the greatest content but who knows, might get better, maybe try to filter content somehow
    static func getArticles(for keyWord: String, result: @escaping (_ json: Any?) -> Void) {
        let endpoint = "https://newsapi.org/v2/everything"
        let parameters: [String:String] = [
            "q": keyWord,
            "sortBy": "publishedAt",
            "apiKey": SensitiveConstants.googleNewsAPIKey,
            "sources": "crypto-coins-news"
        ]
        NetworkRequest.getJSON(from: endpoint, parameters: parameters) { jsonData in
            if let data = jsonData,
               let json = try? JSONSerialization.jsonObject(with: data) {
                result(json)
            } else {
                print("request news error")
                result(nil)
            }
        }
    }
}
