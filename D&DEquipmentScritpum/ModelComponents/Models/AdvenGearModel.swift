//
//  AdvenGearModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 10/13/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct AdvenGear: Codable {
  let index: String
  let name: String
  let equipCat: EquipmentCategory
  let gearCat: GearCategory?
  let toolCat: String?
  let weight: Float64?
  let cost: Cost?
  let desc: [String]?
  let url: String
  
  init(index: String, name: String, equipCat: EquipmentCategory, gearCat: GearCategory?, toolCat: String?, weight: Float64?, cost: Cost?, desc: [String]?, url: String){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.gearCat = gearCat
    self.toolCat = toolCat
    self.weight = weight
    self.cost = cost
    self.desc = desc
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case gearCat = "gear_category"
    case toolCat = "tool_category"
    case weight = "weight"
    case cost = "cost"
    case desc = "desc"
    case url = "url"
  }
}

struct AdvGearList: Codable {
  let index: String
  let name: String
  let equipment: [Equipment]
  
  init(index: String, name: String, equipment: [Equipment]){
    self.index = index
    self.name = name
    self.equipment = equipment
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipment = "equipment"
  }
}

