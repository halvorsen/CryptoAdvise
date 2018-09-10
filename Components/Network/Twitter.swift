//
//  Twitter.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SwifteriOS
import UIKit.UIViewController

/// Singleton class that wraps swifter third party library and has conveinence methods to query twitter
final class Twitter {
    
    static let shared: Twitter = Twitter()
    var swifter: Swifter
    var userInfo: OAuthTwitterUserInfo?
    var signedIn: Bool {
        return userInfo != nil
    }
    
    private init() {
        // inititialize swifter library object
        if let userInfo = FileManager.readEncodableJSONFile(as: OAuthTwitterUserInfo.self, filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename) {
            swifter = Swifter(consumerKey: SensitiveConstants.consumerKeyTwitter, consumerSecret: SensitiveConstants.consumerSecretTwitter, oauthToken: userInfo.key, oauthTokenSecret: userInfo.secret)
            self.userInfo = userInfo
        } else {
            swifter = Swifter(consumerKey: SensitiveConstants.consumerKeyTwitter, consumerSecret: SensitiveConstants.consumerSecretTwitter)
        }
    }
    
    func reset() {
       swifter = Swifter(consumerKey: SensitiveConstants.consumerKeyTwitter, consumerSecret: SensitiveConstants.consumerSecretTwitter)
    }
    
    func authorize(presentingViewController: UIViewController, callback: @escaping (URLResponse) -> Void) {
        swifter.authorize(withCallback: SensitiveConstants.twitterURL, presentingFrom: presentingViewController, success: { (oAuthInfo, urlResponse) in
            self.persistOAuthInfo(oAuthInfo, urlResponse)
            callback(urlResponse)
        })
    }
    
    private func persistOAuthInfo(_ oAuthInfo: Credential.OAuthAccessToken?, _ urlResponse: URLResponse) {
        if let info = oAuthInfo {
            let oauthTwitterUserInfo = OAuthTwitterUserInfo(key: info.key, secret: info.secret, screenName: info.screenName, userID: info.userID)
            self.userInfo = oauthTwitterUserInfo
            FileManager.writeEncodableAsJSONFile(with: oauthTwitterUserInfo, filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename)
        }
    }
    
    // twitter user timelines are used to fetch coin specific timelines and other news timelines
    func getTimeline(for id: String, result: @escaping (_ json: JSON) -> Void) {
        
        swifter.getTimeline(for: "", customParam: ["screen_name":id], count: nil, sinceID: nil, maxID: nil, trimUser: nil, excludeReplies: nil, includeRetweets: nil, contributorDetails: nil, includeEntities: nil, tweetMode: .compat, success: { json in
            result(json)
        }) { error in
         //   print("twitter fetch error: \(error)")
            if let swifterError = error as? SwifterError {
                switch swifterError.kind {
                case .urlResponseError(let status, _, let errorcode):
                    print("error code: \(errorcode)")
                    if (status == 400 && errorcode == 215) || (status == 401 && errorcode == 32) {
                        print("logout!!!!")
                    NotificationCenter.default.post(name: NSNotification.Name("logout"), object: nil)
                    }
                default: break
                }

            }
        }
    }
    
    // twitter search is used to fetch a few thousand recent tweets for a coin and sorted to try to find the best to view
    func search(for searchTerm: String, maxID: String?, result: @escaping (_ json1: JSON, _ json2: JSON) -> Void) {
  
        swifter.searchTweet(using: searchTerm, geocode: nil, lang: "en", locale: nil, resultType: nil, count: 200, until: nil, sinceID: nil, maxID: maxID, includeEntities: true, callback: nil, tweetMode: .compat, success: { (json1, json2) in
            result(json1, json2)
            //print(json1) // ## Debug
        }) { error in
            print("twitter search error: \(error)")
            // do nothing, timeline block will handle errors
        }
    }
}
