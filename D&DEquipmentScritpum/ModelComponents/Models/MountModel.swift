//
//  MountModel.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 4/25/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

// 191-200 & 251-256
struct Mount: Codable {
  let index: String
  let name: String
  let equipCat: EquipmentCategory
  let vehCat: String
  let cost: Cost?
  let speed: Speed
  let capacity: String
  let url: String
  
  init(index: String, name: String, equipCat: EquipmentCategory, vehCat: String, cost: Cost?, speed: Speed, capacity: String, url: String){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.vehCat = vehCat
    self.cost = cost
    self.speed = speed
    self.capacity = capacity
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case vehCat = "vehicle_category"
    case cost = "cost"
    case speed = "speed"
    case capacity = "capacity"
    case url = "url"
  }
}

struct Speed: Codable {
  let quantity: Float64
  let unit: String
  
  init(quantity: Float64, unit: String){
    self.quantity = quantity
    self.unit = unit
  }
  
  enum CodingKeys: String, CodingKey {
    case quantity = "quantity"
    case unit = "unit"
  }
}

// vehicle_category :"Tack, Harness, and Drawn Vehicles"     (starting at 201-250
struct MountEquip: Codable {
  let index: String
  let name: String
  let equipCat: String
  let vehCat: String
  let cost: Cost?
  let weight: Float64
  let desc: [String]?
  let url: String
  
  init(index: String, name: String, equipCat: String, vehCat: String, cost: Cost?, weight: Float64, desc: [String]?, url: String){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.vehCat = vehCat
    self.cost = cost
    self.weight = weight
    self.desc = desc
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case vehCat = "vehicle_category"
    case cost = "cost"
    case weight = "weight"
    case desc = "desc"
    case url = "url"
  }
}

// start MountAll struct here
struct MountAll: Codable {
  let index: String
  let name: String
  let equipCat: EquipmentCategory
  let vehCat: String?
  let cost: Cost?
  let weight: Float64?
  let desc: [String]?
  let speed: Speed?
  let capacity: String?
  let url: String
  
  init(index: String, name: String, equipCat: EquipmentCategory, vehCat: String?, cost: Cost?, weight: Float64, desc: [String]?, speed: Speed?, capacity: String?, url: String){
    self.index = index
    self.name = name
    self.equipCat = equipCat
    self.vehCat = vehCat
    self.cost = cost
    self.weight = weight
    self.desc = desc
    self.speed = speed
    self.capacity = capacity
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case equipCat = "equipment_category"
    case vehCat = "vehicle_category"
    case cost = "cost"
    case weight = "weight"
    case desc = "desc"
    case speed = "speed"
    case capacity = "capacity"
    case url = "url"
  }
}

struct TransportList: Codable {
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


 
 

