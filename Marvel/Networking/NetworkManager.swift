//
//  NetworkManager.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import Foundation
import Alamofire

enum NetworError: Error {
    case urlError
    case canNotParseData
    
}

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}



class APICaller {
    
    
    private static let sharedInstance = APICaller()
    
    class func shared()-> APICaller{
        return APICaller.sharedInstance
    }
    
    func getCharcaters(completion: @escaping (_ error: Error?, _ mainCharacters: MainResponse?) -> Void) {
        guard let mainCharactersURL = URL(string: URLs.characters) else {
            
            print("NO URL")
            return
        }
        let params: [String: String] = ["ts": "1","apikey": APIKeys.publicKey,"hash": APIKeys.hashedKey]
        
        AF.request(mainCharactersURL, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).response { response in
            
            switch response.result{
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(response.error, nil)
                
            case .success(let x):
                
             print(x)
                
                
            }
            
            
            if Connectivity.isConnectedToInternet(){
                
                guard let data = response.data else {
                    
                    print("No Data From API")
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(MainResponse.self, from: data)
                    
                    completion(nil, results)
                    // print(results)
                    
                } catch let error {
                    
                    print(error)
                    
                }
                
            } else {
                print("No Internet Connection")
            }
        }
        
        
        
        
        
        
    }
    
    func getCharcatersDetails(id: Int, completion: @escaping (_ result: Result<HeroDetailsResponse, NetworError>) -> Void) {
        guard let heroDetailsURL = URL(string: URLs.HeroDetails) else {
            completion(.failure(.urlError))
            print("NO URL")
            return
        }
        print(heroDetailsURL)
        let params: [String: String] = ["": "\(id)", "ts": "1","apikey": APIKeys.publicKey,"hash": APIKeys.hashedKey]
        
        
        
        
        AF.request(heroDetailsURL, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).response { response in
            
         
            
            
            if Connectivity.isConnectedToInternet(){
                
                guard let data = response.data else {
                    
                    print("No Data From API")
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(HeroDetailsResponse.self, from: data)
                    
                    completion(.success(results))
                    // print(results)
                    
                } catch let error {
                    completion(.failure(.canNotParseData))
                    print(error)
                    
                }
                
            } else {
                print("No Internet Connection")
            }
        }
        
        
        
    }
    
    func getCharcatersComics(id: String, temp: String, completion: @escaping (_ result: HeroDetailsResponse?,_ error:  Error?) -> Void) {
        let url = URLs.baseURL + "characters/" +  id + temp
        guard let heroDetailsURL = URL(string: url) else {
            print("NO URL")
            return
        }
        print(url)
        let params: [String: String] = ["ts": "1","apikey": APIKeys.publicKey,"hash": APIKeys.hashedKey]
        
        AF.request(heroDetailsURL, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).response { response in
            
         
            
            
            if Connectivity.isConnectedToInternet(){
                
                guard let data = response.data else {
                    
                    print("No Data From API")
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(HeroDetailsResponse.self, from: data)
                    
                    completion(results, nil)
                    // print(results)
                    
                } catch let error {
                    completion(nil, response.error)
                    print(error)
                    
                }
                
            } else {
                print("No Internet Connection")
            }
        }
        
        
        
    }
}
