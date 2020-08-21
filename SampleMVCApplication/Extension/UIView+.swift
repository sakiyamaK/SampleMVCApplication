//
//  UIView+.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/22.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

extension UIView {
  var isShow: Bool {
    get { !self.isHidden }
    set { self.isHidden = !newValue }
  }
}
