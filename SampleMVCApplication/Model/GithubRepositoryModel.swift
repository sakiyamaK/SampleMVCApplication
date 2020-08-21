//
//  GithubUserModel.swift
//  SampleMVCApplication
//
//  Created by sakiyamaK on 2020/08/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

struct GithubResponse: Codable {
  let items: [GithubRepositoryModel]?
}

struct GithubRepositoryModel: Codable {

  struct ownerModel: Codable {
    let avatorURLStr: String
    var avatorURL: URL? { URL.init(string: avatorURLStr) }
    enum CodingKeys: String, CodingKey {
      case avatorURLStr = "avatar_url"
    }
  }

  let id: Int
  let name: String
  let fullName: String
  var avatorURLStr: String { owner.avatorURLStr }
  var avatorURL: URL? { owner.avatorURL }
  private let owner: ownerModel

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case owner
    case fullName = "full_name"
  }
}
