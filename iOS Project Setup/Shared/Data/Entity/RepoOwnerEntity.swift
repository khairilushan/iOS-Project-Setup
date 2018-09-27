//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Gloss

class RepoOwnerEntity: Object, JSONDecodable {
    let userId = RealmOptional<Int>()
    @objc dynamic var login: String?
    @objc dynamic var avatarUrl: String?
    @objc dynamic var htmlUrl: String?

    required init() {
        super.init()
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    override init(value: Any) {
        super.init(value: value)
    }

    required init?(json: JSON) {
        super.init()
        login = "login" <~~ json
        userId.value = "id " <~~ json
        avatarUrl = "avatar_url" <~~ json
        htmlUrl = "html_url" <~~ json
    }
}
