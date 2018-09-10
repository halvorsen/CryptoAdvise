//
//  CryptoAdviseTests.swift
//  CryptoAdviseTests
//
//  Created by Aaron Halvorsen on 8/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import XCTest
@testable import CryptoAdvise

class CryptoAdviseTests: XCTestCase {
    
    func testFileManagerExtension() {
        let oauthTwitterUserInfo = OAuthTwitterUserInfo(key: "key", secret: "secret", screenName: "screenName", userID: "userID")
        FileManager.writeEncodableAsJSONFile(with: oauthTwitterUserInfo, filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename)
        XCTAssertNotNil(FileManager.readEncodableJSONFile(as: OAuthTwitterUserInfo.self, filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename))
        FileManager.delete(filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename)
        XCTAssertNil(FileManager.readEncodableJSONFile(as: OAuthTwitterUserInfo.self, filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename))
    }
    
    func testStringExtension() {
        XCTAssert("https://www.google.com".removehttp() == "")
        XCTAssert("abcde"[4] == "e")
    }
    
}
