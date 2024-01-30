//
//  HeroDetailsVC.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import UIKit

class HeroDetailsVC: UIViewController {
    
    
let sectionTitles = ["","COMICS", "SERIES","STORIES", "EVENTS"]
    var heroDetailsViewModel: HeroesDetailsViewModel?
    private var heroHeader: HeroHeaderView?
    var comics = [MediaCharcterObject]()
     let homeFeedTable: UITableView = {
           let tableView = UITableView(frame: .zero, style: .grouped)
           tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.identifier)
           return tableView
       }()
        

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let notificationName = Notification.Name(rawValue: "PassDataNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: notificationName, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        view.addSubview(homeFeedTable)
        homeFeedTable.separatorStyle = .none
        heroHeader = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 375))
        
        homeFeedTable.tableHeaderView = heroHeader
        heroDetailsViewModel = HeroesDetailsViewModel(heroDetails: self)
        configureLeftNavBar()

        self.heroDetailsViewModel?.getCharacterByID()
        
    }
    
    
    @objc func handleNotification(_ notification: Notification) {
        print("inside Notification")
        if let dict = notification.userInfo as? [String:String] {
            
            print(dict)
        }
        
    }
    
    private func configureLeftNavBar(){
            var leftBarImage = UIImage(named: "icn-nav-back-white")
            leftBarImage = leftBarImage?.withRenderingMode(.alwaysOriginal)
            
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarImage, style: .done, target: nil, action: #selector(backToMainVC))
        }
    
   
    
    @objc func backToMainVC(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.frame
    }
    
    func assignHeroHeaderImage(imageURL: String) {
        
        
        self.heroHeader?.configureImage(image: imageURL)
    }
    

}
extension HeroDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(section)
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as? DescriptionCell else {
                
                return UITableViewCell()
            }
            let name = self.heroDetailsViewModel?.getHeroName()
            let description = self.heroDetailsViewModel?.getHeroDescription()
            cell.configre(name: name!, description: description!)
            return cell
            
            
        } else if indexPath.section == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
            }
            cell.delegate = self // This one

            
            let id = self.heroDetailsViewModel?.getHeroId()
            APICaller.shared().getCharcatersComics(id: id!, temp: "/comics?") {  result, error  in
                
                if let error = error {
                print(error.localizedDescription)
                } else if let  movies = result?.data?.results {
                          var postersArr = [MediaCharcterObject]()
                             
                             for movie in movies {
                              
                                 if movie.thumbnail?.path != nil {
                                     postersArr.append(movie)

                                 }
                                 self.comics = postersArr
                             }
                          cell.configure(titles: postersArr)
                          self.view.hideLoading()
                         }
                
            }
            return cell
        
        } else if indexPath.section == 2{
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
            }
            cell.delegate = self // This one

            
            let id = self.heroDetailsViewModel?.getHeroId()
            APICaller.shared().getCharcatersComics(id: id!, temp: "/series?") {  result, error  in
                
                if let error = error {
                print(error.localizedDescription)
                } else if let  movies = result?.data?.results {
                          var postersArr = [MediaCharcterObject]()
                             
                             for movie in movies {
                              
                                 if movie.thumbnail?.path != nil {
                                     postersArr.append(movie)

                                 }                             }
                          cell.configure(titles: postersArr)
                          self.view.hideLoading()
                         }
                
            }
            return cell
        
            
        } else if indexPath.section == 3{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
            }
            cell.delegate = self // This one
            let id = self.heroDetailsViewModel?.getHeroId()
            APICaller.shared().getCharcatersComics(id: id!, temp: "/stories?") {  result, error  in
                
                if let error = error {
                print(error.localizedDescription)
                } else if let  movies = result?.data?.results {
                          var postersArr = [MediaCharcterObject]()
                             
                             for movie in movies {
                              
                                 if movie.thumbnail?.path != nil {
                                     postersArr.append(movie)

                                 }                             }
                          cell.configure(titles: postersArr)
                          self.view.hideLoading()
                         }
                
            }
            return cell
        
            
        } else if indexPath.section == 4{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
            }
            cell.delegate = self // This one

            
            let id = self.heroDetailsViewModel?.getHeroId()
            APICaller.shared().getCharcatersComics(id: id!, temp: "/events?") {  result, error  in
                
                if let error = error {
                print(error.localizedDescription)
                } else if let  movies = result?.data?.results {
                          var postersArr = [MediaCharcterObject]()
                             
                             for movie in movies {
                                 if movie.thumbnail?.path != nil {
                                     postersArr.append(movie)

                                 }
                             }
                          cell.configure(titles: postersArr)
                          self.view.hideLoading()
                         }
                
            }
            return cell
            
        } else {
            return UITableViewCell()
        }
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      

        print("Did select row \(indexPath.row)")
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    

}

extension HeroDetailsVC: CollectionViewTableViewCellDelegate {
    func didTapedCell(_ cell: CollectionViewTableViewCell, movies: [MediaCharcterObject]) {
        
        DispatchQueue.main.async { [weak self] in
            let vc = PreviewVC()
            vc.configure(titles: movies)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    
    
}
