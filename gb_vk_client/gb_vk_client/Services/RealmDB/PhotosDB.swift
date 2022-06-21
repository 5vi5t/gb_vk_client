//
//  PhotosDB.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import RealmSwift

final class PhotosDB {
    func save(_ photos: [Photo]) {
        do {
            let realm = try Realm()
//            print(realm.configuration.fileURL)
            let oldData = realm.objects(Photo.self)
            try realm.write {
                realm.delete(oldData)
                realm.add(photos)
            }
        } catch {
            print(error)
        }
    }
    
    func fetch() -> [Photo] {
        var photos = [Photo]()
        do {
            let realm = try Realm()
            photos = Array(realm.objects(Photo.self))
        } catch {
            print(error)
        }
        return photos
    }
}
