//
//  Macro.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

//デバッグビルドでしか出ないよ
func DLog(_ obj: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
  var fileName: NSString = file as NSString
  fileName = fileName.lastPathComponent as NSString
  if let obj = obj {
    print("[File:\(fileName) Func:\(function) Line:\(line)] : \(obj)")
  } else {
    print("[File:\(fileName) Func:\(function) Line:\(line)]")
  }
}

//リリースビルドでも出るよ
func ALog(_ obj: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
  var fileName: NSString = file as NSString
  fileName = fileName.lastPathComponent as NSString
  if let obj = obj {
    debugPrint("[File:\(fileName) Func:\(function) Line:\(line)] : \(obj)")
  } else {
    debugPrint("[File:\(fileName) Func:\(function) Line:\(line)]")
  }
}

