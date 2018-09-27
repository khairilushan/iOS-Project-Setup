//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

struct RepoEntity: Codable {
    enum CodingKeys: String, CodingKey {
        case repoId = "id"
        case name
        case fullName = "full_name"
        case desc = "description"
        case owner
        case htmlUrl = "html_url"
    }
    var repoId: Int?
    var name: String?
    var fullName: String?
    var desc: String?
    var htmlUrl: String?
    var owner: RepoOwnerEntity?
}
