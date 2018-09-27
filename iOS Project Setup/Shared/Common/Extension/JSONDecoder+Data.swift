//
//  JSONDecoder+Data.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/27/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static func get<T: Codable>(from data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
