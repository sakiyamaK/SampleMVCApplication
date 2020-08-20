//
//  StartCoordinator.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class StartCoordinator: Coordinator {
  private var navigator: CustomNavigationController?
  private var nextCoordinator: Coordinator?

  deinit {
    DLog()
  }

  init(navigator: CustomNavigationController) {
    self.navigator = navigator
  }

  func start(animated: Bool = true) {
    DispatchQueue.main.async {
      guard let vc = StartViewController.makeFromStoryboard() else { return }
      vc.tappedLoginClousre = {
        UserDefaults.standard.isLogined = true
        NotificationCenter.default.post(name: .reStart, object: nil)
      }
      self.navigator?.pushViewController(vc, animated: animated)
    }
  }
}
