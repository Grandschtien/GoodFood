//
//  Profile.swift
//  GoodFood
//
//  Created by Егор Шкарин on 23.08.2021.
//

import Foundation

struct Profile: Codable {
    let type, name, image, email: String?
    let phone: String?
}
