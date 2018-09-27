//
//  SearchRepositoryViewController.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 11/9/17.
//  Copyright © 2017 Khairil Ushan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IGListKit

final class SearchRepositoryViewController: BaseViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    var presenter: SearchRepositoryPresenterProtocol!

    private lazy var listAdapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        adapter.dataSource = self
        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        listAdapter.collectionView = collectionView
        presenter.onViewLoaded()
        bindSearchTextField()
    }
}

private extension SearchRepositoryViewController {
    func bindSearchTextField() {
        searchTextField.rx.text
                .debounce(0.4, scheduler: MainScheduler.instance)
                .subscribe(onNext: { [unowned self] text in
                    self.presenter.search(keyword: text ?? "")
                })
                .disposed(by: disposeBag)
    }

    func createRepositorySectionController() -> RepositorySectionController {
        let controller = RepositorySectionController()
        controller.onItemClicked()
            .subscribe(onNext: { [weak self] repoId in
                self?.presenter.onClickRepository(repoId: repoId)
            })
            .disposed(by: disposeBag)
        return controller
    }
}

extension SearchRepositoryViewController: SearchRepositoryViewProtocol {
    func updateList() {
        listAdapter.performUpdates(animated: true)
    }

    func setupPageTitle(_ title: String) {
        self.title = title
    }

    func showErrorMessage(_ error: String) {
        let errorAlert = UIAlertControllerStyle.alert.controller(
                title: "Error",
                message: "Something went wrong, please try again!",
                actions: [
                    "Dismiss".alertAction(),
                    "Retry".alertAction { [weak self] _ in
                        self?.presenter.retry()
                    }
                ])
        present(errorAlert, animated: true)
    }
}

extension SearchRepositoryViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return presenter.getItems()
    }

    func listAdapter(
        _ listAdapter: ListAdapter,
        sectionControllerFor object: Any
    ) -> ListSectionController {
        return createRepositorySectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

