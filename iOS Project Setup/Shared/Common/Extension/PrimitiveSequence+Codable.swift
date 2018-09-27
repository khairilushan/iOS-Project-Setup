//
//  PrimitiveSequence+Codable.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/27/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

enum JsonError: Error {
    case parseError
    case invalidJson
}

extension PrimitiveSequence
where TraitType == SingleTrait, ElementType == [AnyHashable: Any] {

    func mapCodable<T: Codable>(_ responseType: T.Type) -> Single<T> {
        return flatMap { json -> Single<T> in
            guard let data = try? JSONSerialization.data(withJSONObject: json, options: []),
                let result: T = JSONDecoder.get(from: data) else {
                    throw JsonError.parseError
            }
            return Single.just(result)
        }
    }

}
