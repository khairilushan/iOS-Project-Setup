//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubRepository {
    func search(params: RequestParams) -> Single<[RepoModel]>
}

struct GithubRepositorySource: GithubRepository {
    let factory: GithubDataSourceFactory

    func search(params: RequestParams) -> Single<[RepoModel]> {
        return factory.getNetwork().search(params: params)
    }
}
