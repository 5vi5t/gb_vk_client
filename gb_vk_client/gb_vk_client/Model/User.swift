//
//  User.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation
import RealmSwift

class User: Object, Decodable {
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var id = 0
    @objc dynamic var avatar = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "first_name"
        case surname = "last_name"
        case avatar = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
