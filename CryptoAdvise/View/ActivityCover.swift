//
//  ActivityCover.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/26/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class ActivityCover: UIView {
    
    private let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityView.color = AppColor.blackDark
        return activityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.white
        addSubview(activityView)
        alpha = 0.0
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.alpha = 1.0
            self.activityView.startAnimating()
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, animations: {
                self.alpha = 0.0
            }) { _ in
                self.activityView.stopAnimating()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
