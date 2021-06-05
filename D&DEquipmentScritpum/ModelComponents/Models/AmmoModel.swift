//
//  AmmoModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 3/12/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct Ammo: Codable {
  let index: String
  let name: String
  let equipCat: EquipmentCategory
  let gearCat: GearCategory?
  let quantity: Int64?
  let cost: Cost?
  let weight: Float64?
  let url: String
  
  init(index: String, name: String, equipCat: EquipmentCategory, gearCat: GearCategory?, quantity: Int64?, cost: Cost?, weight: Float64?, url: String){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.gearCat = gearCat
    self.quantity = quantity
    self.cost = cost
    self.weight = weight
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case gearCat = "gear_category"
    case quantity = "quantity"
    case cost = "cost"
    case weight = "weight"
    case url = "url"
  }
}

struct GearCategory: Codable {
  let index: String
  let name: String
  let url: String
  
  init(index: String, name: String, url: String) {
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

struct AmmoList: Codable {
  let index: String
  let name: String
  let equipment: [Equipment]
  let url: String
  
  init(index: String, name: String, equipment: [Equipment], url: String){
    self.index = index
    self.name = name
    self.equipment = equipment
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipment = "equipment"
    case url = "url"
  }
}
 

