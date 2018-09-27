//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubDataSource: GithubRepository {
}

struct GithubDataSourceFactory {
    private let network: GithubDataSourceNetwork
    private let disk: GithubDataSourceDisk

    init(network: GithubDataSourceNetwork, disk: GithubDataSourceDisk) {
        self.network = network
        self.disk = disk
    }

    func getNetwork() -> GithubDataSourceNetwork {
        return network
    }

    func getDisk() -> GithubDataSourceDisk {
        return disk
    }
}

struct GithubDataSourceNetwork: GithubDataSource {
    private var api: RestApiProtocol

    init(api: RestApiProtocol) {
        self.api = api
    }

    func search(params: RequestParams) -> Single<[RepoModel]> {
        return api.search(params: params)
                .map { $0.items?.map { RepoModel.fromEntity($0) } ?? [] }
    }
}

struct GithubDataSourceDisk {
//    func search(query: String) -> Single<Any> {
//        fatalError("search(query:) has not been implemented")
//    }
}
