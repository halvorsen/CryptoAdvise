//
//  BannerController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/26/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class BannerController {
    
    private var mainViewController: MainViewController
    private var cryptoAdviceModel: CryptoAdvise
    
    init(mainViewController: MainViewController, cryptoAdviceModel: CryptoAdvise) {
        self.mainViewController = mainViewController
        self.cryptoAdviceModel = cryptoAdviceModel
        mainViewController.bannerView.coin.addTarget(self, action: #selector(showList), for: .touchUpInside)
        mainViewController.bannerView.settings.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        createGestures()
        NotificationCenter.default.addObserver(self, selector: #selector(goHomeMainPaging), name: NSNotification.Name("goHomeMainPaging"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(returnToMain), name: NSNotification.Name("logout"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func createGestures() {
        [mainViewController.settingsContainer, mainViewController.graphCover].forEach { view in
            let hideSettingsSwipe = UISwipeGestureRecognizer()
            hideSettingsSwipe.direction = .right
            hideSettingsSwipe.addTarget(self, action: #selector(returnToMain))
            view.addGestureRecognizer(hideSettingsSwipe)
        }
        
        [mainViewController.listContainer, mainViewController.graphCover].forEach { view in
            let hideListSwipe = UISwipeGestureRecognizer()
            hideListSwipe.direction = .left
            hideListSwipe.addTarget(self, action: #selector(returnToMain))
            view.addGestureRecognizer(hideListSwipe)
        }
        
        let hideSettingsTap = UITapGestureRecognizer()
        hideSettingsTap.addTarget(self, action: #selector(returnToMain))
        mainViewController.graphCover.addGestureRecognizer(hideSettingsTap)
        
        let showListTapOnBanner = UITapGestureRecognizer()
        showListTapOnBanner.addTarget(self, action: #selector(showList))
        mainViewController.bannerView.addGestureRecognizer(showListTapOnBanner)
    }
    
    @objc private func showSettings() {
        self.mainViewController.graphCover.alpha = 0.8
        self.mainViewController.graphCover.backgroundColor = AppColor.blackDark
        UIView.animate(withDuration: 0.3) {
            self.mainViewController.settingsAnimatedConstraint.constant = -UIScreen.main.bounds.width*0.70
            self.mainViewController.view.layoutIfNeeded()
            self.mainViewController.statusBarShouldBeHidden = true
            self.mainViewController.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @objc private func showList() {
        UIView.animate(withDuration: 0.5) {
            self.mainViewController.graphCover.alpha = 0.4
            self.mainViewController.listAnimatedConstraint.constant = UIScreen.main.bounds.width*0.86
            self.mainViewController.view.layoutIfNeeded()
            self.mainViewController.statusBarShouldBeHidden = true
            self.mainViewController.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @objc private func returnToMain() {
        
        UIView.animate(withDuration: 0.5) {
            self.mainViewController.listAnimatedConstraint.constant = 0
            self.mainViewController.settingsAnimatedConstraint.constant = 0
            
            self.mainViewController.statusBarShouldBeHidden = false
            self.mainViewController.setNeedsStatusBarAppearanceUpdate()
            
            self.mainViewController.graphCover.alpha = 0.0
            self.mainViewController.graphCover.backgroundColor = AppColor.white
            
            self.mainViewController.view.layoutIfNeeded()
        }
    }
    
    @objc private func goHomeMainPaging() {
        returnToMain()
        mainViewController.mainPagingScrollView.contentOffset.x = 0
    }
}
