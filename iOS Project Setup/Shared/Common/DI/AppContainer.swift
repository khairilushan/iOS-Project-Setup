//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct AppContainer {

    static let shared = AppContainer()

    private let assembler = Assembler()

    func resolve<T>(type: T.Type) -> T {
        return assembler.resolver.resolve(type)!
    }

    func resolve<T, Arg1>(_ type: T.Type, argument: Arg1) -> T {
        return assembler.resolver.resolve(type, argument: argument)!
    }

    func inject() {
        assembler.apply(assemblies: [
            DiskAssembly(),
            InteractorAssembly(),
            NetworkAssembly(),
            RepositoryAssembly(),
            PresenterAssembly(),
            WireframeAssembly()
        ])
    }
}
