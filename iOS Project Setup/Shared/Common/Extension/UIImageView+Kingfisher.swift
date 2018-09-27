//
//  UIImageView+Kingfisher.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/27/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        guard let validUrl = URL(string: url) else { return }
        kf.setImage(with: validUrl)
    }
}
