//
//  Decoder.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let loaded = try! JSONDecoder().decode(T.self, from: data)
        return loaded
    }
}
