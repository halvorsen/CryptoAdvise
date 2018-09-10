//
//  SettingsCollectionView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class SettingsCollectionView: UIScrollView {
    
    var settingsViews: [SettingsExpandingView] = []
    var settings: SettingsModel?
    let headerSpacing: CGFloat = 45
    private weak var settingsDelegate: SettingsDelegate?
    
    init() {
        super.init(frame: CGRect.zero)
    }
    init(settings: SettingsModel, settingsDelegate: SettingsDelegate) {
        self.settingsDelegate = settingsDelegate
        self.settings = settings
        super.init(frame: CGRect.zero)
        backgroundColor = AppColor.white
    }
    
    func setupConstraints() {
        guard let settings = settings else { return }
        for section in settings.sections.enumerated() {
            let view = SettingsExpandingView(titleText: section.element.rawValue, bodyText: settings.content[section.element]!, delegate: settingsDelegate)
            settingsViews.append(view)
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            if section.offset == 0 {
                view.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
                view.title.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
                view.title.isUserInteractionEnabled = false
            } else {
                view.topAnchor.constraint(equalTo: settingsViews[section.offset-1].bottomAnchor).isActive = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
