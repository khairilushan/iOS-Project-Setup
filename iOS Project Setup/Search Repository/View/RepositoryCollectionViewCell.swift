//
//  RepositoryCollectionViewCell.swift
//  iOS Project Setup
//
//  Created by Khairil Ushan on 11/15/17.
//  Copyright © 2017 Khairil Ushan. All rights reserved.
//

import UIKit
import IGListKit

final class RepositoryCollectionViewCell: UICollectionViewCell {

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
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? RepositoryItemViewModel else {
            return
        }
        titleLabel.text = model.title
        authorLabel.text = model.author
        descriptionLabel.text = model.desc
        imageView.loadImage(url: model.avatarUrl)
    }
}
