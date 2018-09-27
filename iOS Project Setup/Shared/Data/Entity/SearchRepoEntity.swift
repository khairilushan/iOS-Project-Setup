//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

struct SearchRepoEntity: Codable {
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResult = "incomplete_result"
        case items
    }
    var totalCount: Int?
    var incompleteResult: Bool?
    var items: [RepoEntity]?
}
