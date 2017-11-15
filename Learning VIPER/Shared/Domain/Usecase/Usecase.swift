//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

protocol UseCase {

    associatedtype ResponseType
    associatedtype Parameters

    func build(params: Parameters) -> Single<ResponseType>

}

extension UseCase {

    func execute(params: Parameters) -> Single<ResponseType> {
        return build(params: params)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background))
                .observeOn(MainScheduler.instance)
    }

}
