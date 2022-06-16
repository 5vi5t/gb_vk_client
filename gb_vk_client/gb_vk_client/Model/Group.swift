//
//  Group.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import Foundation
import RealmSwift

class Group: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_100"
    }
}
