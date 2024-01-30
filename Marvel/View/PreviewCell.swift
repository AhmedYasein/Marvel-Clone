//
//  PreviewCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 30/01/2024.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    static let identifier = "PreviewCell"
    
    
   
    private let previewImageView: UIImageView = {
        
       let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    func setup(movie: MediaCharcterObject){
        let image = (movie.thumbnail?.path)! + "." + (movie.thumbnail?._extension)!
        self.previewImageView.loadImage(image: image)
        self.previewTitle.text = movie.title
        print("image image \(image)")
    
    }

    private let previewTitle: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.sizeToFit()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(previewImageView)
        contentView.addSubview(previewTitle)
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
        
            previewImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            previewImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),

            previewImageView.widthAnchor.constraint(equalToConstant: CGRectGetWidth(self.bounds)),
            previewImageView.heightAnchor.constraint(equalToConstant: CGRectGetWidth(self.bounds)),
            
            previewTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            previewTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            previewTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            previewTitle.topAnchor.constraint(equalTo: self.previewImageView.bottomAnchor,constant: 80)

        
        
        
        ])
        
        
        
    }
    
}


