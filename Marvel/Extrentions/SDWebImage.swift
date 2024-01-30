//
//  SDWebImage.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadImage(image: String){
        guard let url = URL(string: image) else {
            print("Non valid URL")
            return
        }
    self.sd_setImage(with:
                        url, placeholderImage: UIImage(named: "icn-nav-marvel"))

}
}
