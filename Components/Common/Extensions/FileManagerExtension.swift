//
//  FileManagerExtension.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/15/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

/// generic functions for use in persisting data in the user's home file directory
extension FileManager {
    
    static func writeEncodableAsJSONFile<Content: Codable>(with value: Content, filenameWithoutExtension: String) {
        
        guard let data = try? JSONEncoder().encode(value) else { return }
        guard let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        try? data.write(to: documentPath.appendingPathComponent(filenameWithoutExtension + ".json"), options: .atomicWrite)
    
    }
    
    static func readEncodableJSONFile<T: Codable>(as type: T.Type, filenameWithoutExtension: String) -> T? {
        
        guard let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        guard let data = FileManager.default.contents(atPath: documentPath.appendingPathComponent(filenameWithoutExtension + ".json").path) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
        
    }
    
    static func delete(filenameWithoutExtension: String) {

        guard let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
      
        do {
            try FileManager.default.removeItem(atPath: documentPath.appendingPathComponent(filenameWithoutExtension + ".json").path)
        }
        catch let error as NSError {
            print("delete file error: \(error)")
        }
    }
}
