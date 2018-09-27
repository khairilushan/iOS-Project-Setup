//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct InteractorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(
            AnyUseCase<SearchRepositoryInteractor.Params, [RepoModel]>.self,
            factory: { (resolver: Resolver) in
                let repository = resolver.resolve(GithubRepository.self)!
                return AnyUseCase(SearchRepositoryInteractor(repository: repository))
            }
        )
    }
}
