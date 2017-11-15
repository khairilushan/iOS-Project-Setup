//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import Gloss

class SearchRepoEntity: JSONDecodable {
    var totalCount: Int?
    var incompleteResult: Bool?
    var items: [RepoEntity]?

    required init?(json: JSON) {
        totalCount = "totalCount" <~~ json
        incompleteResult = "incomplete_result" <~~ json
        items = "items" <~~ json
    }
}
