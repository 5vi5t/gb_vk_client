//
//  VkService.swift
//  gb_vk_client
//
//  Created by 5vi5t on 08.06.2022.
//

import Foundation
import Alamofire

class VkService {
    
    let baseUrl = "https://api.vk.com/method/"
    
    func loadVkFriends() {
        
        let path = "friends.get"
        let parameters: Parameters = [
            "access_token" : Session.shared.token,
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func loadVkPhotos(userId: String) {
        
        let path = "photos.getAll"
        let parameters: Parameters = [
            "access_token" : Session.shared.token,
            "owner_id" : userId,
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func loadVkGroups(userId: String) {
        
        let path = "groups.get"
        let parameters: Parameters = [
            "access_token" : Session.shared.token,
            "user_id" : userId,
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func searchVkGroups(searchText: String) {
        
        let path = "groups.search"
        let parameters: Parameters = [
            "access_token" : Session.shared.token,
            "q" : searchText,
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
}
