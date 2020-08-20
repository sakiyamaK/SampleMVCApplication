//
//  File.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  private let window: UIWindow

  private var rootTabBarController: RootTabBarController?

  private var nextCoordinators: [Coordinator] = []
  private var nextNavigators: [UINavigationController] = []

  deinit {
    DLog()
  }

  init(window: UIWindow) {
    self.window = window

    NotificationCenter.default.addObserver(self, selector: #selector(reStartSelector), name: .reStart, object: nil)
  }

  func start(animated: Bool = false) {

    if UserDefaults.standard.isLogined {
      DLog("ログイン")

      let homeNavigator = CustomNavigationController()
      let homeCoordinator = HomeCoordinator(navigator: homeNavigator)
      homeCoordinator.start(animated: false)

      let settingNavigator = CustomNavigationController()
      let settingCoordinator = SettingCoordinator(navigator: settingNavigator)
      settingCoordinator.start(animated: false)

      let viewControllers = [homeNavigator, settingNavigator]

      self.rootTabBarController = .init()
      self.window.rootViewController = self.rootTabBarController

      self.rootTabBarController?.setViewControllers(viewControllers, animated: false)

      //coordinatorが解放されないようにプロパティに代入
      nextCoordinators = []
      nextCoordinators.append(homeCoordinator)
      nextCoordinators.append(settingCoordinator)

      //メモリーリーク対策
      nextNavigators.forEach { $0.popViewController(animated: false) }
      nextNavigators = viewControllers
    }
    else {
      DLog("ログアウト")
      let logoutedNavigator = CustomNavigationController()
      window.rootViewController = logoutedNavigator
      let nextCoordinator = StartCoordinator.init(navigator: logoutedNavigator)

      nextCoordinator.start()

      //coordinatorが解放されないようにプロパティに代入
      nextCoordinators = []
      nextCoordinators.append(nextCoordinator)

      //メモリーリーク対策
      nextNavigators.forEach { $0.popViewController(animated: false) }
      nextNavigators = [logoutedNavigator]
    }

    window.makeKeyAndVisible()
  }

  @objc func reStartSelector() {
    start()
  }
}
