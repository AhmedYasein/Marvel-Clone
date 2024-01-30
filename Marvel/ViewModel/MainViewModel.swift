//
//  MainViewModel.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation
import RxSwift
import RxCocoa



class MainViewModel {
    
    // MARK: - Obserable Data Array From API
    var characters = PublishSubject<[resultObject]>()
    weak var heroDetailsViewModel: HeroesDetailsViewModel?
    let disposeBag = DisposeBag()
    // Assigning MainVC instance
     weak var mainVC: MainVC?
    init(mainVC: MainVC? = nil) {
        self.mainVC = mainVC
    }
    
    // Get Characters From API
     func getCharacters(){
         APICaller.shared().getCharcaters { [weak self] error, mainCharacters in
            guard let result = mainCharacters  else {
                print(error?.localizedDescription)
                return
            }
             
             // Filters Characters That have Names and Images
        var charactersData = result.data?.results.filter({$0.name != nil && $0.thumbnail?.path != nil})
             
             
             
             // Append to Characters Array Observable
             self?.characters.onNext(charactersData!)
             
             // Tell That, Appending Finished
             self?.characters.onCompleted()
             
             // Reload TableView With New Data
             self?.mainVC?.reloadTableViewData()
            
        }
        
        
    }
    
    // Get Characters Arrat Count
    func getCharactersCount() -> Int{
        var count: Int = 0
        var x: Observable<Int> {
            return characters.map{$0.count}
        }
        
        x.subscribe(onNext: {counter in
            count = counter
        }).disposed(by: disposeBag)
        return count
    }
    
    
     func bindTableView(){
        // Configure Cell Attributes
        self.characters.bind(to: self.mainVC!.mainTableView.rx.items(cellIdentifier: MainTableViewCell.identifier, cellType: MainTableViewCell.self)) { row, item, cell in
            let name = item.name
            let extention = item.thumbnail?._extension
            let image = item.thumbnail!.path + "." + extention!
            
            cell.configure(image: image, name: name!)
            
        
    }.disposed(by: disposeBag)
        // Select Cell
         self.mainVC!.mainTableView.rx.modelSelected(resultObject.self).bind { charcater in
             if let heroID = charcater.id {
                 print("id from main view model \(heroID)")
                 
                 let id = heroID
                 let name = charcater.name
                 let path = charcater.thumbnail?.path
                 let extention = charcater.thumbnail?._extension
                 let image = path! + "." + extention!
                 let description = charcater.description
                 
                 
                 let heroDict = ["id" : "\(id)", "name" : name, "description": description, "image": image]
                 DispatchQueue.main.async {
                     let notificationName = Notification.Name(rawValue: "PassDataNotification")
                     NotificationCenter.default.post(name: notificationName, object: nil, userInfo: heroDict as [String : Any])
                     
                     //                 self.heroDetailsViewModel?.getCharacterByID(id: heroID)
                 }
             }
        }.disposed(by: disposeBag)
         
//         self.mainVC?.navigationController?.pushViewController(HeroDetailsVC(), animated: true)
    
    }
    
 
    
    
}
