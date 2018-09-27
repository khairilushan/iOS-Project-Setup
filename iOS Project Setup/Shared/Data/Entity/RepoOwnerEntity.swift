//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

struct RepoOwnerEntity: Codable {
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
    var userId: Int?
    var login: String?
    var avatarUrl: String?
    var htmlUrl: String?
}
