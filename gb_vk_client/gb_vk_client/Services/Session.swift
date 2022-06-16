//
//  Session.swift
//  gb_vk_client
//
//  Created by 5vi5t on 05.06.2022.
//

import Foundation
import SwiftKeychainWrapper

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "com.gb.token")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "com.gb.token") ?? ""
        }
    }
    var userId: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "userId")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "userId") ?? ""
        }
    }
    
}
