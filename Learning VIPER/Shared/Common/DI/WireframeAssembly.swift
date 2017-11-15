//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

class WireframeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchRepositoryWireframe.self) { _ in
            return SearchRepositoryWireframeImpl()
        }
    }
}
