//
// Created by Khairil Ushan on 11/9/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import Foundation

protocol RequestParams {
    func build() -> [String: Any]
}
