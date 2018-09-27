//
// Created by Khairil Ushan on 11/15/17.
// Copyright (c) 2017 Khairil Ushan. All rights reserved.
//

import UIKit

extension UIAlertControllerStyle {
    /**
    * Source : https://gist.github.com/riteshhgupta/ce957c5ecfb01d5f47827496cf1d7e4d
    */
    func controller(title: String, message: String, actions: [UIAlertAction]) -> UIAlertController {
        let _controller = UIAlertController(
                title: title,
                message: message,
                preferredStyle: self
        )
        actions.forEach {
            _controller.addAction($0)
        }
        return _controller
    }
}
