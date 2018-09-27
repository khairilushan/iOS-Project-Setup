//
//  RepositoryItemViewModel.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/26/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import IGListKit

final class RepositoryItemViewModel {
    var repoId: Int
    var title: String
    var author: String
    var desc: String
    var avatarUrl: String

    init(repoId: Int, title: String, author: String, desc: String, avatarUrl: String) {
        self.repoId = repoId
        self.title = title
        self.author = author
        self.desc = desc
        self.avatarUrl = avatarUrl
    }

    static func fromModel(_ repo: RepoModel) -> RepositoryItemViewModel {
        return RepositoryItemViewModel(
            repoId: repo.repoId,
            title: repo.fullName,
            author: repo.ownerName,
            desc: repo.description,
            avatarUrl: repo.ownerAvatar ?? ""
        )
    }
}

extension RepositoryItemViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return repoId as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let viewModel = object as? RepositoryItemViewModel {
            return viewModel.repoId == repoId
        }
        return false
    }
}
