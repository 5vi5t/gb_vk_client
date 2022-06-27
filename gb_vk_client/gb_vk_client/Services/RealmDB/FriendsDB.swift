//
//  FriendsDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 19.06.2022.
//

import Foundation
import RealmSwift

final class FriendsDB: RealmDB {
    func save(_ friends: [User]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(friends, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func fetch() -> Results<User>? {
        do {
            let realm = try Realm()
            let friends = realm.objects(User.self)
            return friends
        } catch {
            print(error)
            return nil
        }
    }
}
