//
//  UserDefaults+.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

//全てのUserDefaultsはここに集約する
extension UserDefaults {
  //keyを定義
  private var loginedKey: String { "logined" }
  //computed propertyを用意する
  var isLogined: Bool {
    set { self.set(newValue, forKey: loginedKey) }
    get { self.bool(forKey: loginedKey) }
  }
}
