//
//  HomeViewController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class HomeViewController: CustomViewController {

  override var tabBarIcon: UIImage? { return R.image.iconHome() }

  var tapCell: ((GithubRepositoryModel) -> Void)?

  var repositories: [GithubRepositoryModel] = []

  @IBOutlet private weak var searchTextField: UITextField!
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(R.nib.githubRepositoryTableViewCell)
    }
  }

  static func makeFromStoryboard() -> HomeViewController? {
    guard let vc = R.storyboard.home.instantiateInitialViewController() else { return nil }
    return vc
  }
}

extension HomeViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    DLog()
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    DLog()
    guard let _searchWord = textField.text else { return }
    GithubAPI.shared.get(searchWord: _searchWord, isDesc: true, success: {[weak self] (repositories) in
      guard let _self = self else { return }
      _self.repositories = repositories
      _self.tableView.reloadData()
    }) { (error) in
      DLog(error)
    }
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let repository = repositories[safe: indexPath.row] else {
      return
    }
    tapCell?(repository)
  }
}


extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.githubRepositoryTableViewCell, for: indexPath),
      let repository = repositories[safe: indexPath.row] else {
      return UITableViewCell()
    }

    cell.configure(repository: repository)
    return cell
  }

}
