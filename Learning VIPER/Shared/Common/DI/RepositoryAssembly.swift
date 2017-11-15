//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GithubDataSourceFactory.self) { (resolver: Resolver) in
            let network = resolver.resolve(GithubDataSourceNetwork.self)!
            let disk = resolver.resolve(GithubDataSourceDisk.self)!
            return GithubDataSourceFactory(network: network, disk: disk)
        }
        container.register(GithubRepository.self) { (resolver: Resolver) in
            let factory = resolver.resolve(GithubDataSourceFactory.self)!
            return GithubRepositorySource(factory: factory)
        }
    }
}
