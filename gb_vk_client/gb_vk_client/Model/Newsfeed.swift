//
//  Newsfeed.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.07.2022.
//

import Foundation



struct Newsfeed {
  
  enum NewsfeedType {
    case text
    case photo
    case textAndPhoto
  }
  
  let image: String
  let name: String
  let date: String
  let text: String?
  let photos: [String]?
  let likes: Int
  let comments: Int
  let reposts: Int
  let views: Int
  var newsfeedType: NewsfeedType? {
    let hasText = text != nil
    let hasPhotos = photos != nil
    
    switch (hasText, hasPhotos) {
    case (true, true): return .textAndPhoto
    case (true, false): return .text
    case (false, true): return .photo
    case (false, false): return nil
    }
  }
}
