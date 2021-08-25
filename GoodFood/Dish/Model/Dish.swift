//
//  Dish.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import Foundation
struct Dish: Codable {
    let name, image: String?
    let ingrdients: [Ingrdient]?
}
