//
//  SignInController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/23/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class SignInController: UIController {
    
    private var mainViewController: MainViewController
    
    init(mainViewController: MainViewController) {
        self.mainViewController = mainViewController
        super.init()
        mainViewController.signInView.button.addTarget(self, action: #selector(twitterButtonTouchUpInside), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(logout), name: NSNotification.Name("logout"), object: nil)
    }
    
    @objc private func logout() {
        DispatchQueue.main.async {
        self.clearOAuthInfo()
        self.resetToSignInUI()
        Twitter.shared.reset()
        }
    }
    
    private func clearOAuthInfo() {
        Twitter.shared.userInfo = nil
        FileManager.delete(filenameWithoutExtension: SensitiveConstants.persistedTwitterStructFilename)
    }
    
    private func resetToSignInUI() {
        [mainViewController.graphCover, mainViewController.mainPagingScrollView.page2Cover, mainViewController.mainPagingScrollView.page3Cover, mainViewController.mainPagingScrollView.page4Cover].forEach { $0.stopAnimating()}
        mainViewController.setPagingToTwitterSignIn()
    }
    
    @objc private func twitterButtonTouchUpInside() {
        Twitter.shared.authorize(presentingViewController: mainViewController) { _ in
            self.mainViewController.cryptoAdvise.refreshCurrentCoin()
            if Twitter.shared.signedIn {
                self.mainViewController.setPagingToSignedIn()
            }
        }
    }
}
