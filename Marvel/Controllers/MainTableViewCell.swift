//
//  MainTableViewCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {

  static let identifier = "CustimCell"

    private let characterImageView: UIImageView = {
       let myImage = UIImageView()
        myImage.image = UIImage(systemName: "questionmark")
        myImage.tintColor = .label
        return myImage
    }()
    
    private let characterNameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Anyrhing"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: UIImage, name: String){
        self.characterImageView.image = image
        self.characterNameLabel.text = name
    }
    
    private func setupUI(){
        
        self.contentView.addSubview(characterImageView)
        self.contentView.addSubview(characterNameLabel)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
          //  characterImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            characterImageView.heightAnchor.constraint(equalToConstant: 77),
            characterImageView.widthAnchor.constraint(equalToConstant:  90),
            
            characterNameLabel.leadingAnchor.constraint(equalTo: self.characterImageView.trailingAnchor, constant: 16),
            characterNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            characterNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
    }
}
