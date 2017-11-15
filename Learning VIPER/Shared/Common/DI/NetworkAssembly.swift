//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RestApi.self) { _ in
            return RestApiImpl()
        }
        container.register(GithubDataSourceNetwork.self) { (resolver: Resolver) in
            let restApi = resolver.resolve(RestApi.self)!
            return GithubDataSourceNetwork(api: restApi)
        }
    }
}
