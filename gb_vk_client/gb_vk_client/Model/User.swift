//
//  User.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let id: Int
    let avatar: String
    let fotos: [String]?
    
    
    enum CodingKeys: String, CodingKey {
        case id, fotos
        case name = "first_name"
        case surname = "last_name"
        case avatar = "photo_100"
    }
    
    
    
}
