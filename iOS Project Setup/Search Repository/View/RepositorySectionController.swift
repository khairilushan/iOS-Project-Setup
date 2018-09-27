//
//  RepositorySectionController.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 9/26/18.
//  Copyright © 2018 Khairil Ushan. All rights reserved.
//

import IGListKit
import UIKit
import RxSwift

final class RepositorySectionController: ListSectionController {
    private var viewModel: RepositoryItemViewModel?
    private var itemClickVariable = Variable<Int?>(nil)

    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width, let model = viewModel else {
            return .zero
        }
        return RepositoryCollectionViewCell.size(containerWidth: width, model: model)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeueCellByNib(at: index) as RepositoryCollectionViewCell
        if let model = viewModel {
            cell.bindViewModel(model)
        }
        return cell
    }

    override func didSelectItem(at index: Int) {
        itemClickVariable.value = viewModel?.repoId
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? RepositoryItemViewModel
    }
}

extension RepositorySectionController {
    func onItemClicked() -> Observable<Int> {
        return itemClickVariable.asObservable().filter { $0 != nil }.map { $0! }
    }
}

