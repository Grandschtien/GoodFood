//
//  Liked.swift
//  GoodFood
//
//  Created by Егор Шкарин on 23.08.2021.
//

import Foundation

struct Liked: Codable {
    let type: String?
    let likedModels: [LikedModel]?
}
