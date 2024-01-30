//
//  CollectionViewCell.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: class {
    func didTapedCell(_ cell: CollectionViewTableViewCell, movies: [MediaCharcterObject])
}


class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    
    weak var delegate: CollectionViewTableViewCellDelegate?

    var titles = [MediaCharcterObject]()
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CinematicWorkCollectionViewCell.self, forCellWithReuseIdentifier: CinematicWorkCollectionViewCell.identifier)
        return collectionView
        
        
    }()
     
   
    
    func configure(titles: [MediaCharcterObject]){
        self.titles = titles
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
        
        
    }
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(collectionView)
   
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}




extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CinematicWorkCollectionViewCell.identifier, for: indexPath) as? CinematicWorkCollectionViewCell else {
            
            return UICollectionViewCell()
        }
//        guard let path = titles[indexPath.row].thumbnail?.path else {return UICollectionViewCell()}
//        guard let extention = titles[indexPath.row].thumbnail?._extension else {return UICollectionViewCell()}
//         let image = path + "." + extention
//        guard let name = titles[indexPath.row].name else {return UICollectionViewCell()}
        let title = titles[indexPath.row]
        cell.configureCell(title: title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movies = ["titles" : titles]
//        DispatchQueue.main.async {
//            let notificationName = Notification.Name(rawValue: "passToPreview")
//            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: movies as [String : Any])
//            
//        }
    
                       
        self.delegate?.didTapedCell(self, movies: titles)
                       

        print("section\(indexPath.section)")
        print("row\(indexPath.row)")

    }
    
    
    
}
