//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol BaseApi: TargetType {
    var provider: MoyaProvider<Self> { get }
    var parameters: [String: Any] { get }
    var parameterEncoding: ParameterEncoding { get }
}

extension BaseApi {
    var provider: MoyaProvider<Self> {
        return MoyaProvider<Self>()
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    func execute() -> Single<Response> {
        return Single.create { single in
            let request = self.provider.request(self, callbackQueue: nil, progress: nil) { result in
                switch result {
                case let .success(response):
                    single(.success(response))
                case let .failure(error):
                    single(.error(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

extension BaseApi {
    var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    var sampleData: Data {
        return Data()
    }
    var validate: Bool {
        return true
    }

    var headers: [String: String]? {
        return [:]
    }
}
