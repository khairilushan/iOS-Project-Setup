//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

final class SearchRepositoryPresenter: BasePresenter {

    private weak var view: SearchRepositoryViewProtocol?
    private var interactor: AnyUseCase<SearchRepositoryInteractor.Params, [RepoModel]>
    private var wireframe: SearchRepositoryWireframeProtocol
    private var repos: [RepoModel] = []
    private var repoItems: [RepositoryItemViewModel] = []
    private var currentKeyword = "swift"

    init(
        view: SearchRepositoryViewProtocol,
        interactor: AnyUseCase<SearchRepositoryInteractor.Params, [RepoModel]>,
        wireframe: SearchRepositoryWireframeProtocol
    ) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.view = view
        super.init()
    }
}

extension SearchRepositoryPresenter: SearchRepositoryPresenterProtocol {
    func search(keyword: String) {
        guard !keyword.isEmpty else { return }
        currentKeyword = keyword
        let params = SearchRepositoryInteractor.Params(query: currentKeyword)
        interactor.execute(params: params)
                .subscribe(onSuccess: { [weak self] repos in
                    self?.repos = repos
                    self?.repoItems = repos.map { RepositoryItemViewModel.fromModel($0) }
                    self?.view?.updateList()
                }, onError: { [weak self] error in
                    self?.view?.showErrorMessage(error.localizedDescription)
                })
                .disposed(by: disposeBag)
    }

    func onViewLoaded() {
        search(keyword: currentKeyword)
        view?.setupPageTitle("Cari Repository")
    }

    func retry() {
        search(keyword: currentKeyword)
    }

    func onClickRepository(repoId: Int) {
        guard let repo = repos.filter({ $0.repoId == repoId }).first, let validView = view else {
            return
        }
        wireframe.presentRepositoryDetail(from: validView, repo: repo)
    }

    func getItems() -> [RepositoryItemViewModel] {
        return repoItems
    }
}
