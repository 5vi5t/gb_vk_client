//
//  FriendsAPI.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

final class FriendsAPI: VkAPI {
    
    func loadVkFriends(completion: @escaping ([User]) -> Void) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let parameters: Parameters = [
            "user_id" : userId,
            "access_token" : accessToken,
            "fields" : "first_name, last_name, photo_100",
            "v" : versionVkApi
        ]
        
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: User.self) { response in
            
            //            print(response.request)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response", "items"].rawData()
                let friends = try JSONDecoder().decode([User].self, from: itemsData)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
