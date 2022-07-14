//
//  ImageLoaderService.swift
//  gb_vk_client
//
//  Created by 5vi5t on 05.07.2022.
//

import Foundation
import Alamofire

final class ImageLoaderService {
    
    func loadImage(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
