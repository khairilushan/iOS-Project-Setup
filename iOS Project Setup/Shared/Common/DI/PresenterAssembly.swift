//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct PresenterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(
            SearchRepositoryPresenterProtocol.self,
            factory: { (resolver: Resolver, view: SearchRepositoryViewController) in
                let interactor = resolver
                    .resolve(AnyUseCase<SearchRepositoryInteractor.Params, [RepoModel]>.self)!
                let wireframe = resolver.resolve(SearchRepositoryWireframeProtocol.self)!
                return SearchRepositoryPresenter(
                    view: view,
                    interactor: interactor,
                    wireframe: wireframe
                )
            }
        )
    }
}
