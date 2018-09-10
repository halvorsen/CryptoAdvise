//
//  ListController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class ListController: UIController {
    
    private let mainViewController: MainViewController
    private let listModel: ListModel
    private var coins = [Crypto]()
    
    init(mainViewController: MainViewController, listModel: ListModel) {
        self.mainViewController = mainViewController
        self.listModel = listModel
        coins = listModel.coins.sorted { $0.rawValue < $1.rawValue }
    }
}

extension ListController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! ListCollectionViewCell
        cell.setInterface(coin: coins[index].rawValue)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModel.coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        mainViewController.cryptoAdvise.setCoin(to: coins[index])
        NotificationCenter.default.post(name: NSNotification.Name("goHomeMainPaging"), object: nil)
    }
    
}
