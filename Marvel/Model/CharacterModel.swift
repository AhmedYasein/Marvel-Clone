//
//  CharacterModel.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation

//MARK: - Main screen
struct MainResponse: Codable {
    let data: MainData?
    
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
         
     }
    
}


struct MainData: Codable {
    let offset: Int
    let count: Int
    let results: [resultObject]
    
    enum CodingKeys: String, CodingKey {
        case offset
        case count
        case results
         
     }
}

struct resultObject: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: ThumbnailDetails?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case description
         
     }
}

struct ThumbnailDetails: Codable {
    let path: String
    let _extension: String
    
    
    enum CodingKeys: String, CodingKey {
        case _extension = "extension"
        case path
         
     }
}




