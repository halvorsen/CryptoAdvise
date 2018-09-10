//
//  GraphController.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class GraphsController: UIController {
    
    private var mainViewController: MainViewController
    private var graphsModel: GraphsModel
    
    init(mainViewController: MainViewController, graphsModel: GraphsModel) {
        self.mainViewController = mainViewController
        self.graphsModel = graphsModel
    }
    
}

extension GraphsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return graphsModel.graphs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "graphCell", for: indexPath) as! GraphsCollectionViewCell
        let index = indexPath.row
        
        guard graphsModel.graphs.count > index else { return cell }
        let graphView = GraphView(frame: CGRect.zero)
        graphView.coordinates = graphsModel.graphs[index].graph.unitVectorPrices
        cell.setInterface(graph: (value: graphsModel.graphs[index].graph, kind: graphsModel.graphs[index].kind), view: graphView)
        
        return cell
    }
    
}
