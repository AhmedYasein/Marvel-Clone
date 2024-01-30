//
//  UiView + Loader.swift
//  Marvel
//
//  Created by Shaima Yassen on 29/01/2024.
//

import Foundation
import UIKit

extension UIView {
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.style = .large
        activityIndicator.tag = 333
        return activityIndicator
    }
    
    func showLoading() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoading() {
        if let activityIndicator = viewWithTag(333){
            activityIndicator.removeFromSuperview()
        }
    }
    
}
