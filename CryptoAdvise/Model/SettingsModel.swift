//
//  SettingsModel.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//
import Foundation

final class SettingsModel {
    
    internal enum Section: String {
        case settings, about, help, acknowledgements, privacy, source, logout
    }
    
    let sections: [Section] = [
        .settings,
       // .about,
       // .help,
        .acknowledgements,
       // .privacy,
        .source,
        .logout
    ]
    
    let content: [Section: String] = [
        .settings: "",
        
        .about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        
        .help: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        
        .acknowledgements: "Graphs powered by Binance API\nTweets powered by Twitter API & Swifter library\nNews powered by NewsAPI.org",
        
        .logout: "",
    
        .privacy: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        
        .source: "All the Swift code for this app can be found here: github.com/halvorsen/CryptoAdvise"
    
    ]
    
}


