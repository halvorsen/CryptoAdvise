//
//  CryptoAdvise.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

protocol CrytpoAdviseDelegate: class {
    func updateGraphCollection()
    func updateTweetViews()
    func updateBannerView()
    func updateLinksView()
    func beginCoinRefresh()
    func updateHeadlines()
    func updateSearchViews()
}

final class CryptoAdvise {
    
    let twitterTimelineModel = TwitterTimelineModel()
    let coindeskTimelineModel = TwitterTimelineModel()
    let bloombergTimelineModel = TwitterTimelineModel()
    let twitterSearchModel = TwitterSearchModel()
    let newsHeadlineModel = NewsHeadlineModel()
    let linksModel = LinksModel()
    let graphsModel = GraphsModel()
    let listModel = ListModel()
    let settingsModel = SettingsModel()
    
    private var lastRefresh = Int(Date().timeIntervalSince1970) // in seconds
    
    var currentCoin: Crypto = .BTC
    
    weak var delegate: CrytpoAdviseDelegate?
    
    init(delegate: CrytpoAdviseDelegate) {
        self.delegate = delegate
        setCoin(to: currentCoin)
        coindeskTimelineModel.updateTweets(twitterHandle: "coindesk", completion: {})
        bloombergTimelineModel.updateTweets(twitterHandle: "crypto", completion: {})
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: .UIApplicationDidBecomeActive, object: nil)
    }
    
    func setCoin(to symbol: Crypto) {
        currentCoin = symbol
        refreshAllDataWithCurrentCoin()
    }
    
    func refreshCurrentCoin() {
        refreshAllDataWithCurrentCoin()
    }
    
    @objc private func didBecomeActive() {
        if Int(Date().timeIntervalSince1970) - lastRefresh > 600 { // 10 minutes
            coindeskTimelineModel.updateTweets(twitterHandle: "coindesk", completion: {})
            bloombergTimelineModel.updateTweets(twitterHandle: "crypto", completion: {})
            refreshAllDataWithCurrentCoin()
        }
    }
    
    private func refreshAllDataWithCurrentCoin() {
        lastRefresh = Int(Date().timeIntervalSince1970)
        delegate?.beginCoinRefresh()
        let currentCoin = self.currentCoin
        linksModel.links = Crypto.coinLinks[currentCoin]!.map { linkName, urlString in
            return Link(name: linkName, url: URL(string: urlString))
        }
        delegate?.updateLinksView()
        DispatchQueue.global(qos: .userInitiated).async {
            self.graphsModel.setGraphs(to: currentCoin) {
                self.delegate?.updateGraphCollection()
                self.delegate?.updateBannerView()
                if Twitter.shared.signedIn {
                    self.twitterTimelineModel.updateTweets(twitterHandle: Crypto.twitterHandle[self.currentCoin]![0]) {
                        self.delegate?.updateTweetViews()
                        self.twitterSearchModel.updateTweets(coin: self.currentCoin) {
                            self.delegate?.updateSearchViews()
                            self.newsHeadlineModel.updateHeadlines(coin: self.currentCoin) {
                                self.delegate?.updateHeadlines()
                            }
                        }
                    }
                } else {
                    self.delegate?.updateGraphCollection()
                    self.newsHeadlineModel.updateHeadlines(coin: self.currentCoin) {
                        self.delegate?.updateHeadlines()
                    }
                }
            }
        }
    }
}
