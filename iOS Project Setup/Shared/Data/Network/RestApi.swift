//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift
import Moya_Gloss

protocol RestApi {
    func search(params: RequestParams) -> Single<SearchRepoEntity>
}

struct RestApiImpl: RestApi {
    func search(params: RequestParams) -> Single<SearchRepoEntity> {
        return GithubApi.search(params: params).execute()
            .mapJson()
            .mapCodable(SearchRepoEntity.self)
    }
}
