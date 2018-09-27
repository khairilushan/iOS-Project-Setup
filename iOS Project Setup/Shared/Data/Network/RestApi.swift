//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

protocol RestApiProtocol {
    func search(params: RequestParams) -> Single<SearchRepoEntity>
}

struct RestApi: RestApiProtocol {
    func search(params: RequestParams) -> Single<SearchRepoEntity> {
        return GithubApi.search(params: params).execute()
            .mapJson()
            .mapCodable(SearchRepoEntity.self)
    }
}
