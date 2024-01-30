//
//  CinematicWorkCollectionViewCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 29/01/2024.
//

import Foundation
import UIKit


class CinematicWorkCollectionViewCell: UICollectionViewCell {
    static let identifier = "CinematicWorkCollectionViewCell"
    private let coverImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.sizeToFit()
//        label.backgroundColor = UIColor.yellow
        label.setContentCompressionResistancePriority(.required, for: .vertical)

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setUI() {
    
        
        
        NSLayoutConstraint.activate([
        
            coverImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            coverImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -60),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.coverImageView.bottomAnchor,constant: 40),
//            titleLabel.widthAnchor.constraint(equalToConstant: self.contentView.widthAnchor.),
//            titleLabel.heightAnchor.constraint(equalToConstant: 15)
        
        
        
        ])
        
        
        
    }
    
    public func configureCell(title: MediaCharcterObject){
        let path = title.thumbnail?.path
        let extention = title.thumbnail?._extension
        let image = path! + "." + extention!
        print("image = \(image)")
        coverImageView.loadImage(image: image)
        let name = title.title
        self.titleLabel.text = name
        
    }
}
