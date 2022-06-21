//
//  GroupsDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import RealmSwift

final class GroupsDB {
    func save(_ groups: [Group]) {
        do {
            let realm = try Realm()
//            print(realm.configuration.fileURL)
            let oldData = realm.objects(Group.self)
            try realm.write {
                realm.delete(oldData)
                realm.add(groups)
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
