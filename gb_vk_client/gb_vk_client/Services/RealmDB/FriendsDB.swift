//
//  FriendsDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 19.06.2022.
//

import Foundation
import RealmSwift

final class FriendsDB {
    func save(_ friends: [User]) {
        do {
            let realm = try Realm()
//            print(realm.configuration.fileURL)
            let oldData = realm.objects(User.self)
            try realm.write {
                realm.delete(oldData)
                realm.add(friends)
            }
        } catch {
            print(error)
        }
    }
    
    func fetch() -> [User] {
        var friends = [User]()
        do {
            let realm = try Realm()
            friends = Array(realm.objects(User.self))
        } catch {
            print(error)
        }
        return friends
    }
}
