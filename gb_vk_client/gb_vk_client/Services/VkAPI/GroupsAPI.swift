//
//  GroupsAPI.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.06.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

final class GroupsAPI: VkAPI {
    
    func loadVkGroups(completion: @escaping ([Group]) -> Void) {
        
        let path = "/groups.get"
        let parameters: Parameters = [
            "user_id" : userId,
            "access_token" : accessToken,
            "extended" : "1",
            "fields" : "id, name, photo_100",
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Group.self) { response in
            //            print(response.request)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response", "items"].rawData()
                let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
    
    func searchVkGroups(searchText: String, completion: @escaping ([Group]) -> Void) {
        
        let path = "/groups.search"
        let parameters: Parameters = [
            "access_token" : accessToken,
            "q" : searchText,
            "sort" : "6",
            "count" : "100",
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        if searchText != "" {
            AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Group.self) { response in
                //            print(response.response)
                
                guard let jsonData = response.data else { return }
                
                do {
                    let itemsData = try JSON(jsonData)["response", "items"].rawData()
                    let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                    completion(groups)
                } catch {
                    print(error)
                }
            }
        }
    }
}
