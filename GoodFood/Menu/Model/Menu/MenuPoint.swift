//
//  MenuPoint.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import Foundation
struct MenuPoint: Hashable, Codable {
    var name: String?
    var rating: String?
    var difficualty: String?
    var time: String?
    //TODO: Сделать через тип data
    var image: String?
}
