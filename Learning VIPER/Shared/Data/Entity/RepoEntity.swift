//
// Created by Khairil Ushan on 11/10/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Gloss

class RepoEntity: Object, JSONDecodable {
    let repoId = RealmOptional<Int>()
    @objc dynamic var name: String?
    @objc dynamic var fullName: String?
    @objc dynamic var desc: String?
    @objc dynamic var htmlUrl: String?
    @objc dynamic var owner: RepoOwnerEntity?

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
        repoId.value = "id" <~~ json
        name = "name" <~~ json
        fullName = "full_name" <~~ json
        desc = "description" <~~ json
        owner = "owner" <~~ json
        htmlUrl = "html_url" <~~ json
    }
}
