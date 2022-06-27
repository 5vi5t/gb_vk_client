//
//  RealmDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 23.06.2022.
//

import Foundation
import RealmSwift

class RealmDB {
    
    func deleteAll() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
}
