//
//  RepositoryCollectionViewCell.swift
//  Learning VIPER
//
//  Created by Khairil Ushan on 11/15/17.
//  Copyright © 2017 Khairil Ushan. All rights reserved.
//

import UIKit
import IGListKit

class RepositoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension RepositoryCollectionViewCell {
    static func size(containerWidth: CGFloat, model: RepositoryItemViewModel) -> CGSize {
        return CGSize(width: containerWidth, height: 100)
    }
}

extension RepositoryCollectionViewCell: ListBindable {
    func bindViewModel(_ viewModel: Any!) {
        guard let model = viewModel as? RepositoryItemViewModel else {
            return
        }
        titleLabel.text = model.title
        authorLabel.text = model.author
        descriptionLabel.text = model.desc
    }
}

class RepositoryItemViewModel: ListDiffable {
    var repoId: Int
    var title: String
    var author: String
    var desc: String

    init(repoId: Int, title: String, author: String, desc: String) {
        self.repoId = repoId
        self.title = title
        self.author = author
        self.desc = desc
    }

    func diffIdentifier() -> NSObjectProtocol {
        return repoId as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let viewModel = object as? RepositoryItemViewModel {
            return viewModel.repoId == repoId
        }
        return false
    }

    static func fromModel(_ repo: RepoModel) -> RepositoryItemViewModel {
        return RepositoryItemViewModel(
                repoId: repo.repoId,
                title: repo.fullName,
                author: repo.ownerName,
                desc: repo.description
        )
    }
}

class RepositorySectionController: ListSectionController {
    var viewModel: RepositoryItemViewModel?

    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width, let model = viewModel else {
            return .zero
        }
        return RepositoryCollectionViewCell.size(containerWidth: width, model: model)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "RepositoryCollectionViewCell",
                bundle: nil, for: self, at: index) as? RepositoryCollectionViewCell,
              let model = viewModel else {
            fatalError()
        }
        cell.bindViewModel(model)
        return cell
    }

    override func didUpdate(to object: Any!) {
        viewModel = object as? RepositoryItemViewModel
    }
}
