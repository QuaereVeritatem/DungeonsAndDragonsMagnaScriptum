//
//  AdvenGearModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 10/13/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct AdvenGear: Codable {
  let id: String
  let index: IntegerLiteralType
  let name: String
  let equipCat: String
  let gearCat: String?
  let weight: Float64?
  let cost: Cost
  let desc: [String]?
  let url: String
  
  init(id: String, index: IntegerLiteralType, name: String, equipCat: String, gearCat: String?, weight: Float64?, cost: Cost, desc: [String]?, url: String){
    self.id = id
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.gearCat = gearCat
    self.weight = weight
    self.cost = cost
    self.desc = desc
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case gearCat = "gear_category"
    case weight = "weight"
    case cost = "cost"
    case desc = "desc"
    case url = "url"
  }
}
