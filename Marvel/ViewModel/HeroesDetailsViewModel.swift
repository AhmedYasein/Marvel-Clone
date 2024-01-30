//
//  HeroesDetailsViewModel.swift
//  Marvel
//
//  Created by Shaima Yassen on 28/01/2024.
//

import Foundation
import RxSwift


class HeroesDetailsViewModel {
    var id: String?
    var name: String?
    var description: String?
    weak var heroDetails: HeroDetailsVC?
    init(heroDetails: HeroDetailsVC) {
        
        let notificationName = Notification.Name(rawValue: "PassDataNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: notificationName, object: nil)
        self.heroDetails = heroDetails
        
    }
    
    @objc func handleNotification(_ notification: Notification) {
        print("inside Notification")
        if let dict = notification.userInfo as? [String:String] {
            self.name = dict["name"]
            self.description = dict["description"]
            print(dict)
            self.heroDetails?.homeFeedTable.reloadData()
            let image = dict["image"]
            self.id = dict["id"]
            self.heroDetails?.assignHeroHeaderImage(imageURL: image!)
        }
        
        
        
    }
    
    
    
    func getHeroName() -> String {
       
        return self.name ?? "No Name"
        
        
    }
    
    func getHeroDescription() -> String {
        return self.description ?? "No Description"
    }
    
    func getHeroId() -> String {
        return self.id ?? "No id "
    }
    
    func getCharacterByID(){
//        APICaller.shared().getCharcatersDetails(id: 1017100) { result in
//            switch result {
//            case .success(let character):
//                print(character.data?.results![1].name)
////                HeroesDetailsViewModel.hero = character
//                print(HeroesDetailsViewModel.hero?.data?.results![1].name)
//            case .failure(let error):
//                print(error)
//            }
//            
//        }
        
    }
    
    
  
    
    
    
}
