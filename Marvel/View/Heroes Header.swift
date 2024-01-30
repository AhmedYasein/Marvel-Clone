//
//  Heroes Header.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import UIKit


class HeroHeaderView: UIView {
  
    
    
    private let heroImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "icn-nav-marvel")
                return imageView
    }()

   
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(heroImageView)
//        addGradient()
//        configureImage()

    }
    override func layoutSubviews() {
        heroImageView.frame = self.bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    func configureImage(image: String){
        
        self.heroImageView.loadImage(image: image)
        print("Configred")
        
    }
    private func addGradient(){
          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [
              UIColor.clear.cgColor,
              UIColor.systemBackground.cgColor
          ]
          gradientLayer.frame = self.bounds
          layer.addSublayer(gradientLayer)
      }
    

}
