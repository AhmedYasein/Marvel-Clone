//
//  PreviewVC.swift
//  Marvel
//
//  Created by Shaima Yassen on 29/01/2024.
//

import UIKit

class PreviewVC: UIViewController {
var titles = [MediaCharcterObject]()
    
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 430)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
        
    }()
    override func viewDidLoad() {

        super.viewDidLoad()
        print(titles.count)
        view.addSubview(collectionView)
        view.addSubview(exitbutton)
        setCollectionViewConstraints()
        setExitButtonConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func setCollectionViewConstraints() {
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        
        
        
        ])
    }
    
   
    private let exitbutton: UIButton = {
        
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        button.setImage(UIImage(named:"icn-nav-close-white"), for: .normal)
        
       return button
    }()
    
    @objc func exitButtonAction(sender: UIButton!){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setExitButtonConstraints() {
        
        NSLayoutConstraint.activate([
            exitbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320),
            exitbutton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            exitbutton.widthAnchor.constraint(equalToConstant: 30),
            exitbutton.heightAnchor.constraint(equalToConstant: 30)


        
        
        ])
    }
   
    func configure(titles: [MediaCharcterObject]){
        let vc = PreviewVC()
        self.titles = titles
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PreviewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell else {
            return UICollectionViewCell()
        }
        cell.setup(movie: titles[indexPath.row])
//        cell.backgroundColor = .green
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    
}
