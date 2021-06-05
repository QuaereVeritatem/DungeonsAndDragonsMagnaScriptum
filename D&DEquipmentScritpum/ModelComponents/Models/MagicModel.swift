//
//  MagicModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 10/13/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct Magic: Codable {
  let index: String?
  let name: String?
  let equipCat: EquipmentCategory?
  let gearCat: GearCategory?
  let cost: Cost?
  let weight: Float64?
  let desc: [String]?
  let url: String?
  
  init(index: String?, name: String?, equipCat: EquipmentCategory?, gearCat: GearCategory?, cost: Cost?, weight: Float64?, desc: [String]?, url: String?){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.gearCat = gearCat
    self.cost = cost
    self.weight = weight
    self.desc = desc
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case gearCat = "gear_category"
    case cost = "cost"
    case weight = "weight"
    case desc = "desc"
    case url = "url"
  }
}

struct MagicList: Codable {
  let count: Int64
  let results: [Results]
  
  init(count: Int64, results: [Results]){
    self.count = count
    self.results = results
  }
  
  enum CodingKeys: String, CodingKey {
    case count = "count"
    case results = "results"
  }
}

struct Results: Codable {
  let index: String
  let name: String
  let url: String
  
  init(index: String, name: String, url: String){
    self.index = index
    self.name = name
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case url = "url"
  }
}
