//
//  DescriptionCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import UIKit
class DescriptionCell: UITableViewCell {
    
    static let identifier = "DescriptionCell"
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "name".uppercased()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    
    private let nameLableValue: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 19)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.sizeToFit()
        return label
        
    }()
    
    private let descriptionLabel: UILabel = {
        
       let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.sizeToFit()
        label.text = "description".uppercased()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let descriptionLableValue: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    private func addToView(){
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(nameLableValue)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(descriptionLableValue)

    }
    
   
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 9),
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 45),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
           nameLableValue.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 9),
            nameLableValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            nameLableValue.widthAnchor.constraint(equalToConstant: 90),
            nameLableValue.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLableValue.bottomAnchor, constant: 25),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 9),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 13),
            descriptionLableValue.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 9),
            descriptionLableValue.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            descriptionLableValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            descriptionLableValue.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
//            descriptionLableValue.widthAnchor.constraint(equalToConstant: 90),
//            descriptionLableValue.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
    }
    
    func configre(name: String, description: String){
        self.nameLableValue.text = name
        self.descriptionLableValue.text = description
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addToView()
        setupConstraints()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
