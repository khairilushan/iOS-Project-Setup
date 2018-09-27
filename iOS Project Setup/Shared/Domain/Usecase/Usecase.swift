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

public struct AnyUseCase<Params, ResultType>: UseCase {
    private let _build: (Params) -> Single<ResultType>

    init<U: UseCase>(_ useCase: U) where U.ResponseType == ResultType, U.Parameters == Params {
        _build = useCase.build
    }

    func build(params: Params) -> Single<ResultType> {
        return _build(params)
    }
}
