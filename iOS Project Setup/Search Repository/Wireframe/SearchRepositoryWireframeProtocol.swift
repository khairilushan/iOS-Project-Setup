//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import UIKit

final class SearchRepositoryWireframeImpl {
    static func createSearchRepository() -> SearchRepositoryViewController {
        let controller = SearchRepositoryViewController()
        let presenter = AppContainer.shared.resolve(
            SearchRepositoryPresenterProtocol.self, argument: controller)
        controller.presenter = presenter
        return controller
    }
}

extension SearchRepositoryWireframeImpl: SearchRepositoryWireframeProtocol {
    func presentRepositoryDetail(from view: SearchRepositoryViewProtocol, repo: RepoModel) {
        let detailController = RepositoryDetailWireframeImpl.createRepositoryDetail()
        if let source = view as? UIViewController {
            source.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
