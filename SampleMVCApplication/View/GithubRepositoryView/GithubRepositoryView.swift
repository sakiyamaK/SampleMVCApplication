//
//  File.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Kingfisher

final class GithubRepositoryView: UIView {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!

  func prepare() {
    imageView.image = nil
    titleLabel.text = nil
    subTitleLabel.text = nil
  }

  func configure(repository: GithubRepositoryModel) {
    if let avatorURL = repository.avatorURL {
      imageView.kf.setImage(with: avatorURL)
    }

    titleLabel.text = repository.name
    subTitleLabel.text = repository.name
  }
}
