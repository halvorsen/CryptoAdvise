//
//  LinksController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class LinksController: UIController {
    
    private var mainViewController: MainViewController
    private var linksModel: LinksModel
    
    init(mainViewController: MainViewController, linksModel: LinksModel) {
        self.mainViewController = mainViewController
        self.linksModel = linksModel
    }
}

extension LinksController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return linksModel.links.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "linkCell", for: indexPath) as! LinksCollectionViewCell
        guard linksModel.links.count > index else { return cell }
        cell.setInterface(link: linksModel.links[index])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = linksModel.links[indexPath.row].url, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
