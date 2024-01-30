//
//  MainVC.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    
    var mainViewModel: MainViewModel?
    
    // Creating TableView
    
     let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        //        tableView.isHidden = true
        return tableView
    }()
    
    
    // ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel(mainVC: self)
        mainViewModel!.getCharacters()
        self.mainTableView.delegate = self
        setupTableViewConstraints()
        setLogo()
        showLoader()
        self.mainViewModel!.bindTableView()
        
    }
    
  
    private func showLoader() {
        
        self.view.showLoading()
    }
    
    private func hideLoader() {
        
        self.view.hideLoading()
    }
    
    
    // Reloading Data in TableView
    
    func reloadTableViewData(){
        self.mainTableView.reloadData()
        hideLoader()
    }
    
   // Setting Logo for NavBar
    
    private func setLogo(){
        let logo = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
    
    // Setting TableView Constraints
    
    private func setupTableViewConstraints() {
        self.view.addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor), mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), mainTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), mainTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    


}

// Confirm TableView Delegate

extension MainVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel?.getCharactersCount() ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(HeroDetailsVC(), animated: true)
    }
    
  
}

