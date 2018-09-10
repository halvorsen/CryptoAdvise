//
//  NetworkRequest.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation
import UIKit.UIImage

typealias JSONData = Data

// static functions because this object doesn't hold any state and services the app with just two functions
struct NetworkRequest {
    
    /// Network API request that outputs Data type that serializes into a usable JSON dictionary
    static func getJSON(from endpoint: String, parameters: [String:String], result: @escaping (_ jsonData: JSONData?) -> Void) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            guard let _componentURL = URLComponents(string: endpoint) else {print("invalid url string"); return }
            
            var componentURL = _componentURL
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters { queryItems += [URLQueryItem(name: key, value: value)] }
            componentURL.queryItems = queryItems
            
            guard let url = componentURL.url else {print("something went wrong with url for network request"); return}
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                (data, response, error) in
                
                if error != nil {
                    result(nil)
                }
                else {
                    result(data)
                }
            })
            task.resume()
        }
    }
    
    static func fetchCircleImage(imageURL: String, callback: @escaping (_ image: UIImage?) -> Void) {
        
        //removing normal from image URL gets a twitter image that has higher resolution
        let urlString = imageURL.replacingOccurrences(of: "_normal", with: "")
        
        //check to see if image is cached before fethcing
        if let image = NetworkCache.image[urlString] {
            callback(image)
            return
        }
        
        guard let url = URL(string: urlString) else { callback(nil); return }
        let imageTask = URLSession.shared.dataTask(with: url) { (_data, response, _error) in
            if let error = _error {
                print("Error downloading: \(error)")
                callback(nil)
            }
            else if let data = _data {
                if let image = UIImage(data: data)?.offscreenRenderedCircularImage() {
                    NetworkCache.image[urlString] = image
                    callback(image)
                } else {
                    callback(nil)
                }
            }
            else {
                callback(nil)
                print("image fetch failure")
            }
        }
        imageTask.resume()
    }
}
