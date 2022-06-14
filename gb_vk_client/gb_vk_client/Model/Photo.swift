//
//  Photo.swift
//  gb_vk_client
//
//  Created by 5vi5t on 12.06.2022.
//

import Foundation


struct Photo: Codable {
    let likesCount: Int
    let userLikes: Int
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case likesCount = "count"
        case userLikes = "user_likes"
    }
}



