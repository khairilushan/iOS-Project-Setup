//
//  ListCollectionContext+Dequeueing.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/26/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import IGListKit
import UIKit

extension ListSectionController {
    func dequeueCellByNib<T: UICollectionViewCell>(at index: Int) -> T {
        guard let cell = collectionContext?.dequeueReusableCell(
            withNibName: String(describing: T.self),
            bundle: nil,
            for: self,
            at: index
        ) as? T else {
            fatalError()
        }
        return cell
    }
}
