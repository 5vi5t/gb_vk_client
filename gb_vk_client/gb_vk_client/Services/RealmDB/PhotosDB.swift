//
//  PhotosDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import RealmSwift

final class PhotosDB: RealmDB {
    func save(_ photos: [Photo]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(photos, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
  func fetch(id: Int) -> [Photo] {
        var photos = [Photo]()
        do {
            let realm = try Realm()
          photos = Array(realm.objects(Photo.self).filter("ownerId == %d", id))
        } catch {
            print(error)
        }
        return photos
    }
}
