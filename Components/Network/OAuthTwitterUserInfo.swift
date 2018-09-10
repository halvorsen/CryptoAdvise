//
//  TwitterUserInfo.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/15/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

/// Since each value in this struct is Codable, the struct is also codable with swift's JSONEncoder and is then persisted in a file that is read/write by the extensions in FileManagerExtension.swift
struct OAuthTwitterUserInfo: Codable {
    
    let key: String
    let secret: String
    let screenName: String?
    let userID: String?
    
}
