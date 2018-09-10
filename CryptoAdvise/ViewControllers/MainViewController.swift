//
//  ViewController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
// MARK: Main is the base of our application, this will link our main model with multiple views and controllers (not viewcontrollers). Each controller will controll a subview of main view controller but not "present" those views. This will help to keep our main view controller from being too massive.
final class MainViewController: UIViewController {
    
    lazy var cryptoAdvise = CryptoAdvise(delegate: self)
    let bannerView = Banner()
    private var bannerController: BannerController?
    
    lazy var mainPagingScrollView = MainPagingScrollView(viewDelegate: self)
    
    var signInView = TwitterSignIn()
    private var signInController: SignInController?
    
    private lazy var graphsController = GraphsController(mainViewController: self, graphsModel: cryptoAdvise.graphsModel)
    private var graphsCollectionView: GraphsCollectionView!
    
    private lazy var twitterTimelineController = TwitterTimelineController(mainViewController: self, twitterTimelineModel: cryptoAdvise.twitterTimelineModel)
    private var twitterTimelineCollectionView: TwitterCollectionView!
    
    private lazy var coindeskTimelineController = TwitterTimelineController(mainViewController: self, twitterTimelineModel: cryptoAdvise.coindeskTimelineModel)
    private var coindeskTimelineCollectionView: TwitterCollectionView!
    
    private lazy var bloombergTimelineController = TwitterTimelineController(mainViewController: self, twitterTimelineModel: cryptoAdvise.bloombergTimelineModel)
    private var bloombergTimelineCollectionView: TwitterCollectionView!
    
    private lazy var twitterSearchController = TwitterSearchController(mainViewController: self, twitterSearchModel: cryptoAdvise.twitterSearchModel)
    private var twitterSearchCollectionView: TwitterCollectionView!
    
    private lazy var newsHeadlineController = NewsHeadlineController(mainViewController: self, newsHeadlineModel: cryptoAdvise.newsHeadlineModel)
    private var newsCollectionView: NewsCollectionView!
    
    private lazy var linksController = LinksController(mainViewController: self, linksModel: cryptoAdvise.linksModel)
    private var linksCollectionView: LinksCollectionView!
    
    lazy var graphCover = ActivityCover(frame: view.bounds)
    
    let listContainer = UIView()
    var settingsContainer = SettingsCollectionView()
    private var settingsController: SettingsController?
    private var listCollectionView: ListCollectionView!
    private lazy var listController = ListController(mainViewController: self, listModel: cryptoAdvise.listModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.white
        listContainer.backgroundColor = AppColor.blackMedium
        settingsContainer.backgroundColor = AppColor.white
        
        settingsController = SettingsController(mainViewController: self, settingsModel: cryptoAdvise.settingsModel)
        settingsContainer = SettingsCollectionView(settings: cryptoAdvise.settingsModel, settingsDelegate: settingsController!)
        signInController = SignInController(mainViewController: self)
        bannerController = BannerController(mainViewController: self, cryptoAdviceModel: cryptoAdvise)
         listController = ListController(mainViewController: self, listModel: cryptoAdvise.listModel)
        
        bannerView.setSymbol(for: .graph)
        graphsCollectionView = GraphsCollectionView(dataSource: graphsController, delegate: graphsController)
        twitterTimelineCollectionView = TwitterCollectionView(dataSource: twitterTimelineController, delegate: twitterTimelineController)
        coindeskTimelineCollectionView = TwitterCollectionView(dataSource: coindeskTimelineController, delegate: coindeskTimelineController)
        bloombergTimelineCollectionView = TwitterCollectionView(dataSource: bloombergTimelineController, delegate: bloombergTimelineController)
        twitterSearchCollectionView = TwitterCollectionView(dataSource: twitterSearchController, delegate: twitterSearchController)
        newsCollectionView = NewsCollectionView(dataSource: newsHeadlineController, delegate: newsHeadlineController)
        linksCollectionView = LinksCollectionView(dataSource: linksController, delegate: linksController)
        listCollectionView = ListCollectionView(dataSource: listController, delegate: listController)
        
        mainPagingScrollView.pageControl.addTarget(self, action: #selector(pageControllerValueChanged), for: .valueChanged)
        
        view.addSubview(mainPagingScrollView)
        view.addSubview(mainPagingScrollView.pageControl)
        view.addSubview(bannerView)
        
        if Twitter.shared.signedIn {
            setPagingToSignedIn()
            
        } else {
            setPagingToTwitterSignIn()
        }
        view.addSubview(graphCover)
        view.addSubview(listContainer)
        view.addSubview(settingsContainer)
        
        listContainer.addSubview(listCollectionView)
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        listCollectionView.leftAnchor.constraint(equalTo: listContainer.leftAnchor).isActive = true
        listCollectionView.rightAnchor.constraint(equalTo: listContainer.rightAnchor).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: listContainer.bottomAnchor).isActive = true
        listCollectionView.topAnchor.constraint(equalTo: listContainer.topAnchor).isActive = true
        
        settingsContainer.setupConstraints()
        self.setupAndActivateContraints()
        mainPagingScrollView.setupAndActivateContraints()
        graphCover.startAnimating()
        settingsController?.createSettingsGestures()
       
    }
    
    func setPagingToTwitterSignIn() {
        mainPagingScrollView.removeAllPages()
        mainPagingScrollView.add(page: graphsCollectionView)
        mainPagingScrollView.add(page: signInView)
        mainPagingScrollView.add(page: newsCollectionView)
        mainPagingScrollView.add(page: linksCollectionView)
    }
    
    func setPagingToSignedIn() {
        mainPagingScrollView.removeAllPages()
        mainPagingScrollView.add(page: graphsCollectionView)
        mainPagingScrollView.add(page: twitterTimelineCollectionView)
        mainPagingScrollView.add(page: twitterSearchCollectionView)
        mainPagingScrollView.add(page: newsCollectionView)
        mainPagingScrollView.add(page: linksCollectionView)
        mainPagingScrollView.add(page: coindeskTimelineCollectionView)
        mainPagingScrollView.add(page: bloombergTimelineCollectionView)
    }
    
    var settingsAnimatedConstraint = NSLayoutConstraint()
    var listAnimatedConstraint = NSLayoutConstraint()
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [mainPagingScrollView, bannerView, settingsContainer, listContainer]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        mainPagingScrollView.leftAnchor.constraint(equalTo: listContainer.rightAnchor).isActive = true
        mainPagingScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        mainPagingScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainPagingScrollView.topAnchor.constraint(equalTo: bannerView.bottomAnchor).isActive = true
        
        bannerView.leftAnchor.constraint(equalTo: listContainer.rightAnchor).isActive = true
        bannerView.widthAnchor.constraint(equalTo: mainPagingScrollView.widthAnchor).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        listContainer.widthAnchor.constraint(equalToConstant: 0.86*UIScreen.main.bounds.width).isActive = true
        listContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        listContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listAnimatedConstraint = listContainer.rightAnchor.constraint(equalTo: view.leftAnchor)
        listAnimatedConstraint.isActive = true
        
        settingsContainer.widthAnchor.constraint(equalToConstant: 0.7*UIScreen.main.bounds.width).isActive = true
        settingsContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        settingsContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        settingsAnimatedConstraint = settingsContainer.leftAnchor.constraint(equalTo: view.rightAnchor)
        settingsAnimatedConstraint.isActive = true
        
    }
    
    @objc private func pageControllerValueChanged() {
        mainPagingScrollView.setContentOffset(CGPoint(x: mainPagingScrollView.bounds.width*CGFloat(mainPagingScrollView.pageControl.currentPage), y: 0), animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainPagingScrollView.contentSize = CGSize(width: mainPagingScrollView.bounds.width * CGFloat(mainPagingScrollView.pageViews.count), height: mainPagingScrollView.bounds.height)
    }
    
    var statusBarShouldBeHidden = false
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
}

extension MainViewController: UIScrollViewDelegate, CrytpoAdviseDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(floor(mainPagingScrollView.contentOffset.x / mainPagingScrollView.bounds.width))
        if page != mainPagingScrollView.pageControl.currentPage {
            mainPagingScrollView.pageControl.currentPage = page
        }
        if Twitter.shared.signedIn {
            switch page {
            case 0:
                bannerView.setSymbol(for: .graph)
            case 1:
                bannerView.setSymbol(for: .coin)
            case 2:
                bannerView.setSymbol(for: .hashtag)
            case 3:
                bannerView.setSymbol(for: .news)
            case 4:
                bannerView.setSymbol(for: .link)
            case 5:
                bannerView.setSymbol(for: .news)
            case 6:
                bannerView.setSymbol(for: .news)
            default: break
            }
        } else {
            switch page {
            case 0:
                bannerView.setSymbol(for: .graph)
            case 1:
                bannerView.setSymbol(for: .coin)
            case 2:
                bannerView.setSymbol(for: .news)
            case 3:
                bannerView.setSymbol(for: .link)
            default: break
            }
        }
    }
    
    func updateBannerView() {
        DispatchQueue.main.async {
        self.bannerView.setCoin(text: self.cryptoAdvise.currentCoin.rawValue)
        var priceText: String = ""
        switch self.cryptoAdvise.graphsModel.currentPrice {
        case ...0.1: priceText = String(format: "%.4f", self.cryptoAdvise.graphsModel.currentPrice)
        case 10000.0...: priceText = String(format: "%.0f", self.cryptoAdvise.graphsModel.currentPrice)
        default: priceText = String(format: "%.2f", self.cryptoAdvise.graphsModel.currentPrice)
            }
            self.bannerView.setCoinPrice(text: priceText)
        }
    }
    
    func updateGraphCollection() {
        DispatchQueue.main.async {
            self.graphsCollectionView?.reloadData()
            self.graphCover.stopAnimating()
        }
    }
    
    func updateSearchViews() {
        DispatchQueue.main.async {
            self.cryptoAdvise.twitterSearchModel.sortTweets()
            self.twitterSearchCollectionView?.reloadData()
            self.mainPagingScrollView.page3Cover.stopAnimating()
            self.coindeskTimelineCollectionView?.reloadData()
            self.bloombergTimelineCollectionView?.reloadData()
        }
    }
    
    func updateTweetViews() {
        DispatchQueue.main.async {
            self.twitterTimelineCollectionView?.reloadData()
            self.coindeskTimelineCollectionView?.reloadData()
            self.bloombergTimelineCollectionView?.reloadData()
            self.mainPagingScrollView.page2Cover.stopAnimating()
        }
    }
    
    func updateLinksView() {
        DispatchQueue.main.async {
            self.linksCollectionView?.reloadData()
        }
    }
    
    func updateHeadlines() {
        DispatchQueue.main.async {
            self.newsCollectionView?.reloadData()
            self.mainPagingScrollView.page4Cover.stopAnimating()
            self.newsCollectionView?.layoutSubviews()
        }
    }
    
    func beginCoinRefresh() {
        if Twitter.shared.signedIn {
            DispatchQueue.main.async {
                self.mainPagingScrollView.page2Cover.startAnimating()
                self.mainPagingScrollView.page3Cover.startAnimating()
                self.mainPagingScrollView.page4Cover.startAnimating()
                self.graphCover.startAnimating()
                self.mainPagingScrollView.pageControl.currentPage = 0
                self.mainPagingScrollView.contentOffset.x = 0
                self.mainPagingScrollView.pageViews.forEach { view in
                    if let scrollView = view as? UIScrollView {
                        scrollView.contentOffset.y = 0
                    }
                }
            }
        }
    }
}

