//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation

struct RepoModel {
    var repoId: Int
    var name: String
    var fullName: String
    var description: String
    var ownerName: String
    var ownerId: Int
    var ownerPageUrl: String?
    var ownerAvatar: String?
}

extension RepoModel {
    static func fromEntity(_ entity: RepoEntity) -> RepoModel {
        return RepoModel(
                repoId: entity.repoId ?? 0,
                name: entity.name ?? "",
                fullName: entity.fullName ?? "",
                description: entity.desc ?? "",
                ownerName: entity.owner?.login ?? "",
                ownerId: entity.owner?.userId ?? 0,
                ownerPageUrl: entity.owner?.htmlUrl,
                ownerAvatar: entity.owner?.avatarUrl
        )
    }
}
