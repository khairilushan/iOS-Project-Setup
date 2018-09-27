//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation

enum GithubApi {
    case search(params: RequestParams)
}

extension GithubApi: BaseApi {

    var path: String {
        switch self {
        case .search: return "search/repositories"
        }
    }
    var parameters: [String: Any] {
        switch self {
        case .search(let params): return params.build()
        }
    }

}
