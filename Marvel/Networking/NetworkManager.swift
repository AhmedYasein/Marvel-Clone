//
//  NetworkManager.swift
//  Marvel
//
//  Created by Shaima Yassen on 26/01/2024.
//

import Foundation

protocol Network {
    func fetchData<T: Decodable>(from url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class APICaller: Network {
    func fetchData<T>(from url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        <#code#>
    }
    
    
}
