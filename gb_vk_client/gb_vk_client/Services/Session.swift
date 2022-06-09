//
//  Session.swift
//  gb_vk_client
//
//  Created by 5vi5t on 05.06.2022.
//

import Foundation

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token = String()
    var userId = String()
    
}
