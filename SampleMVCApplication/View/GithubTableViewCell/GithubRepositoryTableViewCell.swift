//
//  GithubRepositoryTableCell.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import SnapKit

final class GithubRepositoryTableViewCell: UITableViewCell {

  private let mainView = R.nib.githubRepositoryView(owner: nil, options: nil)!
  @IBOutlet private weak var mainContainerView: UIView! {
    didSet {
      mainContainerView.addSubview(mainView)
      mainView.snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.leading.equalToSuperview()
        $0.trailing.equalToSuperview()
        $0.bottom.equalToSuperview().priority(.high)
      }
    }
  }

  override func prepareForReuse() {
    mainView.prepare()
  }

  func configure(repository: GithubRepositoryModel) {
    mainView.configure(repository: repository)
  }
}
