//
//  GraphView.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class GraphView: UIView {
    
    var coordinates: [(dx: CGFloat, dy: CGFloat)] = [] 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard self.coordinates.count > 0 else { return }
        let coordinates = self.coordinates
        let path = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        path.move(to: CGPoint(x:coordinates.first!.dx*width, y:coordinates.first!.dy*height))
        for i in 1..<coordinates.count {
            path.addLine(to: CGPoint(x:coordinates[i].dx*width, y:coordinates[i].dy*height))
        }
        AppColor.blackDark.set()
        path.lineWidth = 4
        path.stroke()
        
    }
}
