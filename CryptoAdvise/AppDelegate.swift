//
//  AppDelegate.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
import SwifteriOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MainViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    /// handles the callback from twitter's OAuth
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        Swifter.handleOpenURL(url)
        return true
    }
}
