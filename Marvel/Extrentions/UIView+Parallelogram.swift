//
//  UIView+Parallelogram.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import Foundation
import UIKit
extension UIView {
    
    func applyParallelogramShape(to view: UIView) {
            // Create a mutable path
            let path = UIBezierPath()

            // Define the shape of the parallelogram
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: view.bounds.width - 30, y: 0))
            path.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
            path.addLine(to: CGPoint(x: 30, y: view.bounds.height))
            path.close()

            // Create a shape layer
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath

            // Apply the shape layer to the view's layer
            view.layer.mask = shapeLayer
        }
}
