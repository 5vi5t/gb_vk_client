//
//  GroupsDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import RealmSwift

final class GroupsDB: RealmDB {
    func save(_ groups: [Group]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(groups, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func fetch() -> [Group] {
        var groups = [Group]()
        do {
            let realm = try Realm()
            groups = Array(realm.objects(Group.self))
        } catch {
            print(error)
        }
        return groups
    }
}
