//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RestApiProtocol.self) { _ in
            return RestApi()
        }
        container.register(GithubDataSourceNetwork.self) { (resolver: Resolver) in
            let restApi = resolver.resolve(RestApiProtocol.self)!
            return GithubDataSourceNetwork(api: restApi)
        }
    }
}
