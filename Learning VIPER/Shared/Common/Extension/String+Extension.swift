//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import UIKit

extension String {
    /**
    * Source : https://gist.github.com/riteshhgupta/ce957c5ecfb01d5f47827496cf1d7e4d
    */
    typealias AlertActionHandler = ((UIAlertAction) -> Void)

    func alertAction(style: UIAlertActionStyle = .default, handler: AlertActionHandler? = nil) -> UIAlertAction {
        return UIAlertAction(title: self, style: style, handler: handler)
    }
}
