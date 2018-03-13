//
//  EquipmentModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 1/22/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct Armor: Codable {
  let id: String
  let index: IntegerLiteralType
  let name: String
  let equipCat: String
  let armorCat: String
  let armorClass: ArmorClass
  let strengthMin: IntegerLiteralType?
  let stealthDisadv: Bool?
  let weight: Float64
  let cost: Cost
  let url: String
  
  init(id: String, index: IntegerLiteralType, name: String, equipCat: String, armorCat: String, armorClass: ArmorClass, strengthMin: IntegerLiteralType?, stealthDisadv: Bool?, weight: Float64, cost: Cost, url: String){
    self.id = id
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.armorCat = armorCat
    self.armorClass = armorClass
    self.strengthMin = strengthMin
    self.stealthDisadv = stealthDisadv
    self.weight = weight
    self.cost = cost
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case armorCat = "armor_category"
    case armorClass = "armor_class"
    case strengthMin = "strength"
    case stealthDisadv = "stealth"
    case weight = "weight"
    case cost = "cost"
    case url = "url"
  }
}

struct ArmorClass: Codable {
  let base: IntegerLiteralType
  let dexBonus: Bool
  let maxBonus: IntegerLiteralType? // alot of times this is "null"
  
  init(base: IntegerLiteralType, dexBonus: Bool, maxBonus: IntegerLiteralType?){
    self.base = base
    self.dexBonus = dexBonus
    self.maxBonus = maxBonus
  }
  
  enum CodingKeys: String, CodingKey {
    case base = "base"
    case dexBonus = "dex_bonus"
    case maxBonus = "max_bonus"
  }
}

struct Cost: Codable {
  let quantity: IntegerLiteralType
  let unit: String
  
  init(quantity: IntegerLiteralType, unit: String){
    self.quantity = quantity
    self.unit = unit
  }
  
  enum CodingKeys: String, CodingKey {
    case quantity = "quantity"
    case unit = "unit"
  }
}
