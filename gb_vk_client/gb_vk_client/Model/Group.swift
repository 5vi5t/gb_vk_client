//
//  Group.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation
import RealmSwift

class Group: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var avatar = ""
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
