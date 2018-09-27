//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

struct SearchRepositoryInteractor {
    private let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    struct Params: RequestParams {
        let query: String

        func build() -> [String: Any] {
            return [Constants.ApiParameters.searchQuery: query]
        }
    }
}

extension SearchRepositoryInteractor: UseCase {
    func build(params: Params) -> Single<[RepoModel]> {
        return repository.search(params: params)
    }
}

