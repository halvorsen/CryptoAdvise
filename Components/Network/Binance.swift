//
//  Binance.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/20/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class Binance {
    
    func fetchBinanceDollarPrice(forTicker ticker: String, callback: @escaping (_ stockData: [Double]?) -> Void) {
        guard let (firstSymbol, secondSymbol) = getBinanceSymbols(forTicker: ticker) else { callback(nil); return}
        // fetch historical data for specific coin, either directly to USD or in relation to BTC
        getHistoricalData(symbol: firstSymbol) { dataSet in
            guard let firstDataSet = dataSet else {callback(nil); return}
            if let second = secondSymbol {
                
                func computeAndSendCallback() {
                    var price = [Double]()
                    guard let data = self.dataSetBTC else {callback(nil); return}
                    let lowerCount = min(data.count, firstDataSet.count)
                    let dataMidIndex = data.count - lowerCount
                    let firstDataMidIndex = firstDataSet.count - lowerCount
                    for i in 0..<lowerCount{
                        price.append(data[dataMidIndex + i] * firstDataSet[firstDataMidIndex + 1])
                    }
                    callback(price)
                }
                
                if self.dataSetBTC == nil {
                    // this coin needs to translate from coin/BTC to USD
                    self.getHistoricalData(symbol: "BTCUSDT") { _dataSet in
                        
                        guard let secondDataSet = _dataSet else {callback(nil); return }
                        self.dataSetBTC = secondDataSet
                        // since binance can send back a range of a few dozen days of data up to 1000 days we find the minimum common amount between BTC/USDT and myCoin/BTC
                        computeAndSendCallback()
                    }
                    
                } else {
                    computeAndSendCallback()
                }
                
                
            } else {
                callback(firstDataSet)
            }
        }
    }
    
    // binance returns historical prices up to 1000 days but not always, sometimes only a couple months of data comes back
    private func getHistoricalData(symbol: String, result: @escaping (_ prices: [Double]?) -> Void) {
        let interval = "1d"
        let limit = "1000"
        var componentURL = URLComponents(string: "https://api.binance.com/api/v1/klines")!
        
        componentURL.queryItems = [
            URLQueryItem(name: "symbol", value: symbol),
            URLQueryItem(name: "interval", value: interval),
            URLQueryItem(name: "limit", value: limit),
        ]
        
        let request = URLRequest(url: componentURL.url!)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                result(nil)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!) as? [[Any]] {
                        
                        let priceArray = json.map { Double($0[4] as! String)! }
                        result( priceArray )
                    } else {
                        print("json error")
                    }
                    
                }
                catch {
                    print("error in JSONSerialization")
                    result(nil)
                }
            }
        })
        
        task.resume()
        
    }
    
    private var dataSetBTC: [Double]?
    
    private func getBinanceSymbols(forTicker ticker: String) -> (String, String?)? {
        let _symbols = Crypto.binanceFetchSymbols[ticker.uppercased()]
        guard let symbols = _symbols else { return nil}
        
        if symbols.count == 1 {
            return (symbols[0],nil)
        }
        else  {
            return (ticker + "BTC", "BTCUSDT")
        }
    }

}
