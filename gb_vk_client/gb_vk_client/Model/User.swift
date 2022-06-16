//
//  User.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation
import RealmSwift

class User: Object, Codable {
    @objc dynamic var name: String
    @objc dynamic var surname: String
    @objc dynamic var id: Int
    @objc dynamic var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "first_name"
        case surname = "last_name"
        case avatar = "photo_100"
    }
    
    
    
}
