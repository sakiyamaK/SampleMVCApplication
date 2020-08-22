//
//  StartViewController.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

//継承しないクラスにはfinalをつける
final class StartViewController: CustomViewController {

  //他のControllerと連携用
  //protocolを使ったDelegteでやることもある
  var tappedLoginClousre: (()->Void)?

  //公開しない変数はprivateにする
  @IBOutlet private weak var loginButton: UIButton! {
    didSet {
      //ローカライズなどもここでやる
      loginButton.addTarget(self, action: #selector(tapLoginButton(sender:)), for: .touchUpInside)
    }
  }

  //Coordinatorから呼び出す
  static func makeFromStoryboard() -> StartViewController? {
    guard let vc = R.storyboard.start.instantiateInitialViewController() else { return nil }
    return vc
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
}

//extensionをprivateにすることでこの中のfuncを全部privateにする
private extension StartViewController {
  @objc func tapLoginButton(sender: UIButton) {
    DLog()
    self.tappedLoginClousre?()
  }
}
