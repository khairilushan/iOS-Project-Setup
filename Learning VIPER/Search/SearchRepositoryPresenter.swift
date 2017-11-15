//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchRepositoryPresenter {
    func search(keyword: String)
    func retry()
    func onViewLoaded()
    func onClickRepository(on row: Int)
    func getItems() -> [RepositoryItemViewModel]
}

class SearchRepositoryPresenterImpl: BasePresenter {

    weak var view: SearchRepositoryView?

    fileprivate var interactor: SearchRepositoryInteractor!
    fileprivate var wireframe: SearchRepositoryWireframe!
    fileprivate var repos: [RepoModel] = []
    fileprivate var repoItems: [RepositoryItemViewModel] = []
    fileprivate var currentKeyword = "swift"

    init(interactor: SearchRepositoryInteractor, wireframe: SearchRepositoryWireframe) {
        super.init()
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension SearchRepositoryPresenterImpl: SearchRepositoryPresenter {
    func search(keyword: String) {
        guard !keyword.isEmpty else {
            return
        }
        currentKeyword = keyword
        let params = SearchRepositoryInteractor.Params(query: currentKeyword)
        interactor.execute(params: params)
                .map { $0.map { RepositoryItemViewModel.fromModel($0) } }
                .subscribe(onSuccess: { [weak self] items in
                    self?.repoItems = items
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

    func onClickRepository(on row: Int) {
        guard row < repos.count, let validView = view else {
            return
        }
        wireframe.presentRepositoryDetail(from: validView, repo: repos[row])
    }

    func getItems() -> [RepositoryItemViewModel] {
        return repoItems
    }
}
