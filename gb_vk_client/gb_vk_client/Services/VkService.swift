//
//  VkService.swift
//  gb_vk_client
//
//  Created by 5vi5t on 08.06.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class VkService {
    
    let baseUrl = "https://api.vk.com/method"
    let userId = Session.shared.userId
    let accessToken = Session.shared.token
    let versionVkApi = "5.131"
    
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
            
            //            print(response.data?.prettyJSON)
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
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let fotos = try JSONDecoder().decode([Photo].self, from: itemsData)
                completion(fotos)
            } catch {
                print(error)
            }
        }
    }
    
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
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
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
                    let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                    let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                    completion(groups)
                } catch {
                    print(error)
                }
            }
        }
    }
}
