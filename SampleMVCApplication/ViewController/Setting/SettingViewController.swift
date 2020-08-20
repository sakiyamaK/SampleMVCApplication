//
//  SettingViewController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class SettingViewController: CustomViewController {

  override var tabBarIcon: UIImage? { return R.image.iconUser() }

  //他のControllerと連携用
  //protocolを使ったDelegteでやることもある
  var tappedLogoutClousre: (()->Void)?

  @IBOutlet private weak var logoutButton: UIButton! {
    didSet {
      //ローカライズなどもここでやる
      logoutButton.addTarget(self, action: #selector(tapLogoutButton(sender:)), for: .touchUpInside)
    }
  }

  //Coordinatorから呼び出す
  static func makeFromStoryboard() -> SettingViewController? {
    guard let vc = R.storyboard.setting.instantiateInitialViewController() else { return nil }
    return vc
  }
}

//extensionをprivateにすることでこの中のfuncを全部privateにする
private extension SettingViewController {

  @objc func tapLogoutButton(sender: UIButton) {
    DLog()
    self.tappedLogoutClousre?()
  }
}
