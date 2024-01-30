//
//  CharacterDetails.swift
//  Marvel
//
//  Created by Shaima Yassen on 27/01/2024.
//

import Foundation

struct HeroDetailsResponse: Codable {
    let data: HeroDetails?

    enum CodingKeys: String, CodingKey {
        
        case data
    }
}

struct HeroDetails: Codable{
    let offset: Int?
    let count: Int?
    let results:[MediaCharcterObject]?
    
    enum CodingKeys: String, CodingKey {
        case offset
        case count
        case results
         
     }
}
struct MediaCharcterObject: Codable{
    let name: String?
    let thumbnail: ThumbnailDetailsForComics?
    let description: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case thumbnail
        case description
        case title
         
     }
}


struct ThumbnailDetailsForComics: Codable {
        let path: String?
        let _extension: String?
        
        
        enum CodingKeys: String, CodingKey {
            
            case path
            case _extension = "extension"
        }
        
        
        
    }



