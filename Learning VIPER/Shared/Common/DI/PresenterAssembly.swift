//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct PresenterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchRepositoryPresenter.self) { (resolver: Resolver) in
            let interactor = resolver.resolve(SearchRepositoryInteractor.self)!
            let wireframe = resolver.resolve(SearchRepositoryWireframe.self)!
            return SearchRepositoryPresenterImpl(interactor: interactor, wireframe: wireframe)
        }
    }
}
