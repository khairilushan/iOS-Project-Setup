//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import UIKit

protocol SearchRepositoryWireframe {
    func presentRepositoryDetail(from view: SearchRepositoryView, repo: RepoModel)
}

class SearchRepositoryWireframeImpl {
    static func createSearchRepository() -> SearchRepositoryViewController {
        let controller = SearchRepositoryViewController()
        let presenter = AppContainer.shared.resolve(type: SearchRepositoryPresenter.self)
        if let presenter = presenter as? SearchRepositoryPresenterImpl {
            presenter.view = controller
        }
        controller.presenter = presenter
        return controller
    }
}

extension SearchRepositoryWireframeImpl: SearchRepositoryWireframe {
    func presentRepositoryDetail(from view: SearchRepositoryView, repo: RepoModel) {
        let detailController = RepositoryDetailWireframeImpl.createRepositoryDetail()
        if let source = view as? UIViewController {
            source.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
