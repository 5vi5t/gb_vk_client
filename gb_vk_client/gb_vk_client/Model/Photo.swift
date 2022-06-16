//
//  Photo.swift
//  gb_vk_client
//
//  Created by 5vi5t on 12.06.2022.
//

import Foundation
//import RealmSwift

class Photo: Codable {
    let id: Int
    let likes: Likes
    let sizes: [Size]
}

class Likes: Codable {
    let likesCount: Int
    let isLiked: Int

    enum CodingKeys: String, CodingKey {
        case likesCount = "count"
        case isLiked = "user_likes"
    }
}

class Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}



