//
//  PrimitiveSequence+Json.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/27/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension PrimitiveSequence
where TraitType == SingleTrait, ElementType == Response {

    func mapJson() -> Single<[AnyHashable: Any]> {
        return flatMap { response -> Single<[AnyHashable: Any]> in
            guard let json = try response.mapJSON() as? [AnyHashable: Any] else {
                throw JsonError.invalidJson
            }
            return Single.just(json)
        }
    }

}
