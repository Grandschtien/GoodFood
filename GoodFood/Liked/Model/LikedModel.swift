//
//  LikedModel.swift
//  GoodFood
//
//  Created by Егор Шкарин on 23.08.2021.
//

import Foundation


struct LikedModel: Codable {
    var name: String?
    var rating: String?
    var difficualty: String?
    var time: String?
    //TODO: Сделать через тип data
    var image: String?
}
