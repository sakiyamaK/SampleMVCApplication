//
//  NSNotification+.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

extension NSNotification.Name {
  //ログイン/ログアウトが発生したときにAppCoordinatorのstartを再度呼ぶための通知
  static let reStart = Notification.Name("reStart")
}
