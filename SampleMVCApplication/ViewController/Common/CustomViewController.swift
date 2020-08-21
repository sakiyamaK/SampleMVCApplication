//
//  CustomViewController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

//tabbarのアイコンを指定した画像にするためのprotocol
protocol ConfigTabBarItemProtocol: UIViewController {
  var tabBarIcon: UIImage? { get }
  func configureTabBarItem()
}

extension ConfigTabBarItemProtocol {
  func configureTabBarItem() {
    guard let _tabBarIcon = tabBarIcon else { return }
    DLog(_tabBarIcon)
    tabBarItem = UITabBarItem(title: "",
                              image: _tabBarIcon.withRenderingMode(.alwaysOriginal),
                              selectedImage: _tabBarIcon.withRenderingMode(.alwaysTemplate))
  }
}

class CustomViewController: UIViewController, ConfigTabBarItemProtocol {

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

  //全てのUIViewControllerが通る初期化処理
  private func setup() {
    configureTabBarItem()
  }
}
