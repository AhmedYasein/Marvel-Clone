//
//  MainTableViewCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    // Set Cell identifier
    
  static let identifier = "CustimCell"
    
    // Character ImageView
    
    private let characterImageView: UIImageView = {
       let myImage = UIImageView()
        myImage.tintColor = .label
        return myImage
    }()
    
    
    // Set Charcater Label
    private let characterNameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor.white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Configure Cell Attributes
    
    public func configure(image:String, name: String){
    self.characterImageView.loadImage(image: image)
        self.characterNameLabel.text = name
        
    }
    
    
    private func setupCellUI() {
        AddingImageViewToView()
        setupImageViewConstrints()
        AddingNameLabelToView()
        setupNameLabelConstrints()
    }
    
    private func AddingImageViewToView() {
        
        self.contentView.addSubview(characterImageView)

    }
    
    private func AddingNameLabelToView() {
        
        self.contentView.addSubview(characterNameLabel)

    }
    private func setupImageViewConstrints(){
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            characterImageView.heightAnchor.constraint(equalToConstant: 77),
//            characterImageView.widthAnchor.constraint(equalToConstant:  90),
            
           
        ])
    }
    
    private func setupNameLabelConstrints() {
        
        NSLayoutConstraint.activate([
        
            characterNameLabel.leadingAnchor.constraint(equalTo: self.characterImageView.leadingAnchor, constant: 25),
//            characterNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            characterNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 100),
//            characterNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -40),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 35),
            characterNameLabel.widthAnchor.constraint(equalToConstant: 130)
            
        
        
        ])
        
        
    }
}
