//
//  Photo.swift
//  gb_vk_client
//
//  Created by 5vi5t on 12.06.2022.
//

import Foundation
import RealmSwift

class Photo: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var likesCount = 0
    @objc dynamic var isLiked = 0
    @objc dynamic var fotoUrl = ""
    
    enum CodingKeys: String, CodingKey {
        case id, likes, sizes
    }
    
    enum SizesKeys: String, CodingKey {
        case url
    }
    
    enum LikesKeys: String, CodingKey {
        case likesCount = "count"
        case isLiked = "user_likes"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let items = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try items.decode(Int.self, forKey: .id)
        var sizeItems = try items.nestedUnkeyedContainer(forKey: .sizes)
        var sizeItemArray = [String]()
        while !sizeItems.isAtEnd {
            let sizeItem = try sizeItems.nestedContainer(keyedBy: SizesKeys.self)
            let url = try sizeItem.decode(String.self, forKey: .url)
            sizeItemArray.append(url)
        }
        guard let url = sizeItemArray.last else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: items.codingPath + [CodingKeys.sizes], debugDescription: "sizes cannot be empty"))
        }
        self.fotoUrl = url
        let likeItems = try items.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.likesCount = try likeItems.decode(Int.self, forKey: .likesCount)
        self.isLiked = try likeItems.decode(Int.self, forKey: .isLiked)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}



