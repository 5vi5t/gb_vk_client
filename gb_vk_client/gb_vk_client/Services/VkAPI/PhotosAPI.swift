//
//  PhotosAPI.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

final class PhotosAPI: VkAPI {
    
    func loadVkPhotos(userId: String, completion: @escaping ([Photo]) -> Void) {
        
        let path = "/photos.getAll"
        let parameters: Parameters = [
            "access_token" : accessToken,
            "owner_id" : userId,
            "extended" : "1",
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Photo.self) { response in
//            print(response.request)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response", "items"].rawData()
                let fotos = try JSONDecoder().decode([Photo].self, from: itemsData)
                completion(fotos)
            } catch {
                print(error)
            }
        }
    }
}
