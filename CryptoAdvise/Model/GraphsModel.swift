//
//  GraphsModel.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

enum GraphKind {
    case twoYear, oneYear, sixMonth, threeMonth, oneMonth, fiveDays
    static let value: [GraphKind: String] = [
        .twoYear: "2year",
        .oneYear: "1year",
        .sixMonth: "6month",
        .threeMonth: "3month",
        .oneMonth: "1month",
        .fiveDays: "5days"
    ]
}

final class GraphsModel {
    
    var currentPrice: Double = 0.0
    var graphs: [(graph: Graph, kind: GraphKind)] = []
    
    func setGraphs(to symbol: Crypto, completion: @escaping () -> Void) {
        var timeout = Timer()
        DispatchQueue.main.async {
            timeout = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { _ in
                completion()
            }
        }
        Binance().fetchBinanceDollarPrice(forTicker: symbol.rawValue) { prices in
            guard let coinPrices = prices else { return }
            if coinPrices.count > 0 {
                self.currentPrice = coinPrices.last!
            } else {
                return
            }
            let timeSpans: [(Int, GraphKind)] = [ (730, .twoYear), (365, .oneYear), (180, .sixMonth), (90, .threeMonth), (30, .oneMonth), (5, .fiveDays)]
            var _graphs: [(graph: Graph, kind: GraphKind)] = []
            timeSpans.forEach { (days, kind) in
                if coinPrices.count >= days {
                    _graphs.append((Graph(prices: Array(coinPrices.suffix(days)))!, kind))
                }
            }
            self.graphs = _graphs
            timeout.invalidate()
            completion()
        }
    }
}

