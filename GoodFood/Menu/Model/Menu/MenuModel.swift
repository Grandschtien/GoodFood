//
//  MenuModel.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import Foundation

struct MenuModel: Hashable, Codable {
    var type: String
    var menuPoints: [MenuPoint]?
    var headerItems: [HeaderItem]?
}

