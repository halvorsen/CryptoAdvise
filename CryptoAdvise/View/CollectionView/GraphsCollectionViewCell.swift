//
//  GraphsCollectionViewCell.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class GraphsCollectionViewCell: BaseCollectionViewCell {
    
    private let timeSpan = UILabel()
    private let percentChange = UILabel()
    private let highPrice = UILabel()
    private let lowPrice = UILabel()
    private let stack = UIStackView()
    private var graphView: GraphView?
    private var graphContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.load()
        }
    }
    
    private func load() {
       
        stack.alignment = .center
        stack.spacing = 10
        stack.axis = .horizontal
        stack.setContentCompressionResistancePriority(.required, for: .vertical)
        containerView.addSubview(stack)
        graphContainer.backgroundColor = .clear
        containerView.addSubview(graphContainer)
        [timeSpan, percentChange, highPrice, lowPrice].forEach {
            
            $0.textColor = AppColor.blackDark
            $0.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
            stack.addArrangedSubview($0)
            
        }
        
        setupAndActivateContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInterface(graph: (value: Graph, kind: GraphKind), view: GraphView) {
  
            self.graphView?.removeFromSuperview()
            self.graphView = view
            self.graphContainer.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leftAnchor.constraint(equalTo: self.graphContainer.leftAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: self.graphContainer.rightAnchor).isActive = true
            view.topAnchor.constraint(equalTo: self.graphContainer.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.graphContainer.bottomAnchor).isActive = true
            
            self.timeSpan.text = GraphKind.value[graph.kind]!
            
            var priceTextHigh: String = ""
            var priceTextLow: String = ""
            switch graph.value.high {
            case ...0.1: priceTextHigh = "H:" + String(format: "%.4f", graph.value.high)
            case 10000.0...: priceTextHigh = "H:" + String(format: "%.0f", graph.value.high)
            default: priceTextHigh = "H:" + String(format: "%.2f", graph.value.high)
            }
            switch graph.value.low {
            case ...0.1: priceTextLow = "L:" + String(format: "%.4f", graph.value.low)
            case 10000.0...: priceTextLow = "L:" + String(format: "%.0f", graph.value.low)
            default: priceTextLow = "L:" + String(format: "%.2f", graph.value.low)
            }
            self.percentChange.text = String(format: "%.2f", graph.value.percentChange) + "%"
            self.highPrice.text = priceTextHigh
            self.lowPrice.text = priceTextLow
            [self.timeSpan, self.percentChange, self.highPrice, self.lowPrice].forEach { $0.addTextSpacing(value: 1.4) }
     
    }
    
    private var graphConstraints = [NSLayoutConstraint]()
    private func setupAndActivateContraints() {
        let subviews: [UIView] = [stack, graphContainer]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        stack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        stack.bottomAnchor.constraint(equalTo: graphContainer.topAnchor, constant: -50).isActive = true
        stack.leftAnchor.constraint(greaterThanOrEqualTo: containerView.leftAnchor, constant: 10).isActive = true
        stack.rightAnchor.constraint(lessThanOrEqualTo: containerView.rightAnchor, constant: -10).isActive = true
        
        let scalar = UIScreen.main.bounds.width/375
        graphContainer.widthAnchor.constraint(equalToConstant: 255*scalar).isActive = true
        graphContainer.heightAnchor.constraint(equalToConstant: 130*scalar).isActive = true
        graphContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        graphContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50).isActive = true
        
    }
    
}
