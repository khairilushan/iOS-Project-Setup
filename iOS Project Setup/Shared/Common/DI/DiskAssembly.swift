//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Swinject

struct DiskAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GithubDataSourceDisk.self) { _ in
            return GithubDataSourceDisk()
        }
    }
}
