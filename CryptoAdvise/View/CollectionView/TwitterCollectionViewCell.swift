//
//  TwitterCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class TwitterCollectionViewCell: BaseCollectionViewCell {
    
    private let tweet = UITextView()
    private let tweeterName = UILabel()
    private let tweeter = UILabel()
    private let tweeterPicture = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.load()
        }
    }
    
    private func load() {
        tweet.isScrollEnabled = false
        tweet.isEditable = false
        tweet.isSelectable = false
        tweet.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        tweeterName.textColor = AppColor.blackDark
        tweeterName.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        tweeter.textColor = AppColor.blackDark.withAlphaComponent(0.67)
        tweeter.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        [tweet, tweeter, tweeterName, tweeterPicture].forEach { containerView.addSubview($0) }
        
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInterface(with image: UIImage?, tweeterName: String, tweeter: String, tweetContent: String) {
        DispatchQueue.main.async {
            self.setTweetText(tweeterName: tweeterName, tweeter: tweeter, tweetContent: tweetContent)
            self.setTweetImage(image)
        }
    }
    
    private func setTweetText(tweeterName: String, tweeter: String, tweetContent: String) {
        tweet.text = tweetContent
        self.tweeterName.text = tweeterName
        self.tweeter.text = tweeter
        [self.tweeterName, self.tweeter].forEach { $0.addTextSpacing(value: 1.4) }
        tweet.addTextSpacing(value: 1.4)
        tweet.textColor = AppColor.blackDark
        tweet.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
    }
    
    private func setTweetImage(_ image: UIImage?) {
        tweeterPicture.image = image
    }
    
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [tweet, tweeter, tweeterPicture, tweeterName]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        tweeterPicture.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        tweeterPicture.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        tweeterPicture.widthAnchor.constraint(equalToConstant: 70).isActive = true
        tweeterPicture.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        tweeterName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40).isActive = true
        tweeterName.topAnchor.constraint(equalTo: tweeterPicture.bottomAnchor, constant: 20).isActive = true
        tweeterName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        tweeter.leftAnchor.constraint(equalTo: tweeterName.rightAnchor, constant: 10).isActive = true
        tweeter.rightAnchor.constraint(lessThanOrEqualTo: containerView.rightAnchor, constant: -40).isActive = true
        tweeter.centerYAnchor.constraint(equalTo: tweeterName.centerYAnchor).isActive = true
        tweeter.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
        tweet.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 35).isActive = true
        tweet.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -35).isActive = true
        tweet.topAnchor.constraint(equalTo: tweeterName.bottomAnchor).isActive = true
        tweet.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
    }
    
}
