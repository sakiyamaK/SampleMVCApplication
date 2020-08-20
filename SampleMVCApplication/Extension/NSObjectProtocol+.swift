//
//  NSObjectProtocol.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
  static var className: String {
    return String(describing: self)
  }
}
