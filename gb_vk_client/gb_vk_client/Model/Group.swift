//
//  Group.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation

struct Group: Codable {
    let id: Int
    let name: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_100"
    }
}
