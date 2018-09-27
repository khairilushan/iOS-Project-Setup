//
//  SearchRepositoryContract.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/26/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import UIKit

protocol SearchRepositoryViewProtocol: class {
    func updateList()
    func setupPageTitle(_ title: String)
    func showErrorMessage(_ error: String)
}

protocol SearchRepositoryPresenterProtocol {
    func search(keyword: String)
    func retry()
    func onViewLoaded()
    func onClickRepository(repoId: Int)
    func getItems() -> [RepositoryItemViewModel]
}

protocol SearchRepositoryWireframeProtocol {
    func presentRepositoryDetail(from view: SearchRepositoryViewProtocol, repo: RepoModel)
}
