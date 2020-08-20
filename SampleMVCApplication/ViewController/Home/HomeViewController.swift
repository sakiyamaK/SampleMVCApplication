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

  static func makeFromStoryboard() -> HomeViewController? {
    guard let vc = R.storyboard.home.instantiateInitialViewController() else { return nil }
    return vc
  }
}
