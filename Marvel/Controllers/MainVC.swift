//
//  MainVC.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import UIKit

class MainVC: UIViewController {
    
    private let images: [UIImage] = [
        
        UIImage(named: "icn-nav-marvel")!,
        UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com")!
    
    
    ]

    private let mainTableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = .gray
        tableView.allowsSelection = true
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        setupUI()
        setLogo()
     
        // Do any additional setup after loading the view.
    }
    private func setLogo(){
        let logo = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
    
    private func setupUI() {
        self.view.addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor), mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), mainTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), mainTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
                                    ])
    }




}


extension MainVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else
        {
            return UITableViewCell()
        }
        let image = images[indexPath.row]
        cell.configure(image: image, name: indexPath.row.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row", indexPath.row)
    }
}
