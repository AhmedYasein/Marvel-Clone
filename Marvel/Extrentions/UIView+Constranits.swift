//
//  UIView+Constranits.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation
import UIKit

enum ConstraintsRelationType{
    case Equal
    case LessThanOrEqual
    case GreaterThanOrEqual
}



extension UIView {
    
    func setConstraintsWithAnchor(
        top : NSLayoutYAxisAnchor? = nil, topRelation: ConstraintsRelationType? = .Equal, paddingTop : CGFloat? = 0,
        bottom : NSLayoutYAxisAnchor? = nil,bottomRelation: ConstraintsRelationType? = .Equal, paddingBottom : CGFloat? = 0,
        leading: NSLayoutXAxisAnchor? = nil, leadingRelation: ConstraintsRelationType? = .Equal, paddingLeading: CGFloat? = 0,
        trailing: NSLayoutXAxisAnchor? = nil, trailingRelation: ConstraintsRelationType? = .Equal, paddingTrailing: CGFloat? = 0
    ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top, let paddingTop = paddingTop, let topRelation = topRelation{
            setConstraintsFor(viewAnchor: topAnchor, relativeAnchor: top, padding: paddingTop, constraintsRelation: topRelation)
        }
        
        if let bottom = bottom, let paddingBottom = paddingBottom, let bottomRelation = bottomRelation{
            setConstraintsFor(viewAnchor: bottomAnchor, relativeAnchor: bottom, padding: paddingBottom, constraintsRelation: bottomRelation)
        }
        
        if let leading = leading, let paddingLeading = paddingLeading, let leadingRelation = leadingRelation {
            setConstraintsFor(viewAnchor: leadingAnchor, relativeAnchor: leading, padding: paddingLeading, constraintsRelation: leadingRelation)
        }
        
        if let trailing = trailing, let paddingTrailing = paddingTrailing, let trailingRelation = trailingRelation {
            
            setConstraintsFor(viewAnchor: trailingAnchor, relativeAnchor: trailing, padding: paddingTrailing, constraintsRelation: trailingRelation)
        }
    }
    
    //For X axis
    private func setConstraintsFor(
        viewAnchor: NSLayoutXAxisAnchor,
        relativeAnchor: NSLayoutXAxisAnchor,
        padding: CGFloat,
        constraintsRelation: ConstraintsRelationType){
            
            switch constraintsRelation {
            case .Equal:
                viewAnchor.constraint(equalTo: relativeAnchor, constant: padding).isActive = true
            case .LessThanOrEqual:
                viewAnchor.constraint(lessThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
            case .GreaterThanOrEqual:
                viewAnchor.constraint(greaterThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
            }
            
        }
    
    //For Y axis
    private func setConstraintsFor(
        viewAnchor: NSLayoutYAxisAnchor,
        relativeAnchor: NSLayoutYAxisAnchor,
        padding: CGFloat,
        constraintsRelation: ConstraintsRelationType){
            
            switch constraintsRelation {
            case .Equal:
                viewAnchor.constraint(equalTo: relativeAnchor, constant: padding).isActive = true
            case .LessThanOrEqual:
                viewAnchor.constraint(lessThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
            case .GreaterThanOrEqual:
                viewAnchor.constraint(greaterThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
            }
            
        }
    
    func setWidth(relation: ConstraintsRelationType, constant: CGFloat){
        
        switch relation {
        case .Equal:
            self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        case .LessThanOrEqual:
            self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        case .GreaterThanOrEqual:
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        }
    }
    
    func setHeightAnchor(relation: ConstraintsRelationType, constant: CGFloat){
        switch relation {
        case .Equal:
            self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        case .LessThanOrEqual:
            self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        case .GreaterThanOrEqual:
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        }
    }
    
    func center(centerX : NSLayoutXAxisAnchor? = nil, paddingX : CGFloat? = nil   ,
                centerY : NSLayoutYAxisAnchor? = nil, paddingY : CGFloat? = nil)  {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX , constant: paddingX ?? 0).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY , constant: paddingY ?? 0).isActive = true
        }
        
    }
    
    
}
