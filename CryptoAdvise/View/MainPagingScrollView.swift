//
//  MainPagingScrollView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class MainPagingScrollView: UIScrollView {
    
    let pageControl = RoundedPageControl()
    var pageViews: [UIView] = []
    private var pageControlWidthAnchor = NSLayoutConstraint()
    var page2Cover = ActivityCover(frame: CGRect.zero)
    var page3Cover = ActivityCover(frame: CGRect.zero)
    var page4Cover = ActivityCover(frame: CGRect.zero)
    
    init(viewDelegate: UIScrollViewDelegate) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = AppColor.white
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        delegate = viewDelegate
              
        pageControl.currentPageIndicatorTintColor = AppColor.white
        pageControl.pageIndicatorTintColor = AppColor.pageIndicatorDot
        pageControl.backgroundColor = AppColor.pageIndicatorBackground
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
    }
    
    func add(page view: UIView) {
        pageViews.append(view)
        pageControl.numberOfPages = pageViews.count
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: CGFloat(pageViews.count*2 - 1), constant: 0).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        let activityCover = ActivityCover()
        addSubview(activityCover)
        activityCover.translatesAutoresizingMaskIntoConstraints = false
        activityCover.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        activityCover.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        NSLayoutConstraint(item: activityCover, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: CGFloat(pageViews.count*2 - 1), constant: 0).isActive = true
        activityCover.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        switch pageViews.count {
        case 2: page2Cover = activityCover
        case 3: page3Cover = activityCover
        case 4: page4Cover = activityCover
        default: break
        }
        
        pageControlWidthAnchor.isActive = false
        pageControlWidthAnchor = pageControl.widthAnchor.constraint(equalToConstant: 20 * CGFloat(pageControl.numberOfPages))
        pageControlWidthAnchor.isActive = true
    }
    
    func removeAllPages() {
        pageViews.forEach { $0.removeFromSuperview() }
        pageViews.removeAll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAndActivateContraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
}
