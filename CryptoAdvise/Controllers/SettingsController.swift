//
//  SettingsController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class SettingsController: UIController {
    
    private var mainViewController: MainViewController
    private var settings: SettingsModel
    
    init(mainViewController: MainViewController, settingsModel: SettingsModel) {
        self.mainViewController = mainViewController
        self.settings = settingsModel
        super.init()
    }
    
    internal func createSettingsGestures() {

        for view in mainViewController.settingsContainer.settingsViews.enumerated() {
            let tap = UITapGestureRecognizer()
            tap.name = String(view.offset)
            if view.offset != 0 {
            tap.addTarget(self, action: #selector(selectedView(_:)))
            view.element.addGestureRecognizer(tap)
            }
        }
    }
    
    @objc private func selectedView(_ tap: UITapGestureRecognizer) {
        if let viewOffset = tap.name,
            let offset = Int(viewOffset) {
            mainViewController.settingsContainer.settingsViews[offset].toggleContent()
        }
    }
}

extension SettingsController: SettingsDelegate {
    func tappedButton(with title: String) {
        if title.lowercased() == "logout" {
            NotificationCenter.default.post(name: NSNotification.Name("logout"), object: nil)
        }
    }
}
