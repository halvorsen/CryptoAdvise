//
//  Graph.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation
import CoreGraphics

struct Graph {
    
    let graphPrices: [Double]
    //  0 -> 1 by elements, 0 -> 1 by value that will easily translate into data visualization
    let unitVectorPrices: [(dx: CGFloat, dy: CGFloat)]
    let percentChange: Double
    let low: Double
    let high: Double
    
    init?(prices: [Double]) {
        guard prices.count > 4 else {return nil}
        let reducedPrices = prices.reducedToSetOfTwelve()
        graphPrices = reducedPrices
        let minimumPrice = reducedPrices.min()!
     
        let maximumPrice = reducedPrices.max()!
        let range = maximumPrice - minimumPrice
        let count = reducedPrices.count
        unitVectorPrices = reducedPrices.enumerated().map { price in
            let dx = Double(price.offset)/Double(count - 1)
     
            let dy = 1.0 - 0.96*(price.element - minimumPrice) / range - 0.02
            return (CGFloat(dx),CGFloat(dy))
        }
        high = prices.max()!
        low = prices.min()!
        percentChange = 100 * (prices.last! - prices.first!) / prices.first!
    }
    
}

extension Array where Iterator.Element == Double {
    func reducedToSetOfTwelve() -> [Double] {
        if self.count < 12 {
            return self
        }
        let dataSetCount: Int = Int(floor(Double(self.count) / 10.0))
        var reducedSet: [Double] = []
        reducedSet.append(self.first!)
        for i in 0..<9 {
            var newValue = 0.0
            let startIndex = i*dataSetCount
            let endIndex = (i+1)*dataSetCount
            for j in startIndex..<endIndex {
                newValue += self[j]
            }
            reducedSet.append(newValue/Double(dataSetCount))
        }
        var newValue = 0.0
        let midIndex = 8*dataSetCount
        for k in midIndex..<self.count {
            newValue += self[k]
        }
        reducedSet.append(newValue/Double(self.count - midIndex))
        reducedSet.append(self.last!)
        return reducedSet
    }
}
