//
//  SettingCoordinator.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class SettingCoordinator: Coordinator {
  private var navigator: CustomNavigationController?
  private var nextCoordinator: Coordinator?

  deinit {
    DLog()
  }

  init(navigator: CustomNavigationController) {
    self.navigator = navigator
  }

  func start(animated: Bool = true) {
    guard let vc = SettingViewController.makeFromStoryboard() else { return }
    vc.tappedLogoutClousre = {
      UserDefaults.standard.isLogined = false
      NotificationCenter.default.post(name: .reStart, object: nil)
    }
    self.navigator?.pushViewController(vc, animated: animated)
  }
}
