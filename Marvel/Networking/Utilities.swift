//
//  Constants.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation

class APIKeys {
    
    static let ts = "1"
    static let privateKey = "4b4355f243e0bb9a43f0ae6b1c9047a779432de5"
    static let publicKey = "e2553d8a04a1f783e97087846e4740dc"
    static let finalKey = ts + privateKey + publicKey
    
    static let hashedKey = MD5Alogrithm.getMdHash(value: finalKey)
   
    
    
}
class URLs {
    
    static let baseURL = "https://gateway.marvel.com/v1/public/"
//    static let v1Public = baseURL + "v1/public/"
    static let characters = baseURL + "characters?"
    static let HeroDetails = baseURL + "characters"
}

class Constants {
    
    
    
    
}

