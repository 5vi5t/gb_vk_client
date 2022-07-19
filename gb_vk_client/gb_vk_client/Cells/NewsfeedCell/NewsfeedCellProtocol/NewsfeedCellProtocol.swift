//
//  NewsfeedCellProtocol.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.07.2022.
//

import Foundation

protocol NewsfeedCellProtocol {
  func configure<T: NewsfeedCellDataProtocol>(value: T)
}

protocol NewsfeedCellDataProtocol {
  var image: String { get }
  var name: String { get }
  var date: String { get }
  var text: String? { get }
  var photos: [String]? { get }
  var likes: Int { get }
  var comments: Int { get }
  var reposts: Int { get }
  var views: Int { get }
}

extension Newsfeed: NewsfeedCellDataProtocol {}










