//
//  HomeCoordinator.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
  private var navigator: CustomNavigationController?
  private var nextCoordinator: Coordinator?

  deinit {
    DLog()
  }

  init(navigator: CustomNavigationController) {
    self.navigator = navigator
  }

  func start(animated: Bool = true) {
    guard let vc = HomeViewController.makeFromStoryboard() else { return }
    self.navigator?.pushViewController(vc, animated: animated)
  }
}
