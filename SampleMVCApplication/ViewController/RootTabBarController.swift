//
//  RootTabBarController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class RootTabBarController: CustomTabBarController {
  weak var previousViewController: UIViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
}

extension RootTabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    previousViewController = viewController
  }
}
