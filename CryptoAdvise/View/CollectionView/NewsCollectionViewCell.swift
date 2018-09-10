//
//  NewsCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class NewsCollectionViewCell: BaseCollectionViewCell {
    
    private let preview = UILabel()
    private let newsAgency = UILabel()
    private let title = UILabel()
    private let titlePicture = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.load()
        }
    }
    
    private func load() {
        preview.numberOfLines = 0
        preview.textColor = AppColor.blackDark
        preview.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        
        newsAgency.textColor = AppColor.blackDark.withAlphaComponent(0.67)
        newsAgency.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        title.numberOfLines = 0
        title.textColor = AppColor.blackDark
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        [preview, title, newsAgency, titlePicture].forEach { containerView.addSubview($0) }
        
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInterface(with headline: Headline) {
        DispatchQueue.main.async {
            self.setNewsText(titleName: headline.newsSource, title: headline.headline, NewsContent: headline.content)
            self.setNewsImage(headline.image)
        }
    }
    
    private func setNewsText(titleName: String, title: String, NewsContent: String) {
        self.preview.text = NewsContent
        self.newsAgency.text = titleName
        self.title.text = title
        [self.preview, self.newsAgency, self.title].forEach { $0.addTextSpacing(value: 1.4) }
    }
    
    private func setNewsImage(_ image: UIImage?) {
        titlePicture.image = image
    }
    
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [preview, title, titlePicture, newsAgency]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      
        preview.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40).isActive = true
        preview.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -40).isActive = true
        preview.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        preview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
        newsAgency.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40).isActive = true
        newsAgency.topAnchor.constraint(equalTo: titlePicture.bottomAnchor, constant: 20).isActive = true
        
        title.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40).isActive = true
        title.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -40).isActive = true
        title.topAnchor.constraint(equalTo: newsAgency.bottomAnchor, constant: 10).isActive = true
        
        titlePicture.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        titlePicture.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        titlePicture.widthAnchor.constraint(equalToConstant: 70).isActive = true
        titlePicture.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
}
