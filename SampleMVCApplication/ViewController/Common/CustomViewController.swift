//
//  CustomViewController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
  //タブバーのアイコンを更新する場合はこれを継承先でoverrideする
  var tabBarIcon: UIImage? { return nil }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    setup()
  }

  override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
    super.init(nibName: nil, bundle: nil)
    setup()
  }

  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
}

private extension CustomViewController {
  //全てのUIViewControllerが通る初期化処理
  func setup() {
    configureTabBarItem()
  }

  func configureTabBarItem() {
    guard let _tabBarIcon = tabBarIcon else { return }
    DLog(_tabBarIcon)
    tabBarItem = UITabBarItem(title: "",
                              image: _tabBarIcon.withRenderingMode(.alwaysOriginal),
                              selectedImage: _tabBarIcon.withRenderingMode(.alwaysTemplate))
  }
}
