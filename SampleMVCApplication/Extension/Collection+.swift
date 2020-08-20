//
//  Collection+.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

extension Collection {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
