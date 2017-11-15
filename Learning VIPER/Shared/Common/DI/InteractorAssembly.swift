//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct InteractorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchRepositoryInteractor.self) { (resolver: Resolver) in
            let repository = resolver.resolve(GithubRepository.self)!
            return SearchRepositoryInteractor(repository: repository)
        }
    }
}
