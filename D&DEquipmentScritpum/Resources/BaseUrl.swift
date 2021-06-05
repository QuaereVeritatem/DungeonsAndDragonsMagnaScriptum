//
//  BaseUrl.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 1/22/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

let introUrl: String = "http://dnd5eapi.co"

let BaseUrl: String = "http://dnd5eapi.co/api/equipment/"

// This endpoint is a list of all the equipment categories
let eqCatListUrl = "https://www.dnd5eapi.co/api/equipment-categories/"

// This endpoint is the list of all the armor(no armor specific details)
let ArmorListUrl = "https://www.dnd5eapi.co/api/equipment-categories/armor"

// This endpoint is a list of all the ammunition
let ammoListUrl = "https://www.dnd5eapi.co/api/equipment-categories/ammunition"

// This endpoint is a list of all the magic items
let magicItemListUrl = "https://www.dnd5eapi.co/api/magic-items"

// This endpoint is a list of all the adventure gear?
let advGearListurl = "https://www.dnd5eapi.co/api/equipment-categories/adventuring-gear"

// This endpoint is a list of all the transport things
let transportListUrl = "https://www.dnd5eapi.co/api/equipment-categories/mounts-and-vehicles"

//armor direct urls for each armor set (this a cheat and we will need to take in all equipment then sort by categories into diff models
// or use link ending with /api/equipment-categories/armor  (below armor is less than half of total list)
let armorDirectUrls = [
    URL(string: "https://www.dnd5eapi.co/api/equipment/padded"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/leather"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/studded-leather"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/hide"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/chain-shirt"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/scale-mail"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/breastplate"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/half-plate"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/ring-mail")
]

//ammo direct urls
let ammoDirectUrls = [
    URL(string: "https://www.dnd5eapi.co/api/equipment/arrow"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/blowgun-needle"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/crossbow-bolt"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/sling-bullet"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/ammunition"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/arrow-of-slaying")
]

//magic item direct urls
let magItemDirectUrls = [
    URL(string: "https://www.dnd5eapi.co/api/magic-items/adamantine-armor"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/ammunition"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/amulet-of-health"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/amulet-of-proof-against-detection-and-location"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/amulet-of-the-planes"),
    URL(string: "https://www.dnd5eapi.co/api/magic-items/animated-shield")
]

//adventure item direct urls
let advItemDirectUrls = [
    URL(string: "https://www.dnd5eapi.co/api/equipment/abacus"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/acid-vial"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/alchemists-fire-flask"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/arrow"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/blowgun-needle"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/crossbow-bolt")
]

//transport item direct urls
let transItemDirectUrls = [
    URL(string: "https://www.dnd5eapi.co/api/equipment/mule"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/elephant"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/horse-draft"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/horse-riding"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/mastiff"),
    URL(string: "https://www.dnd5eapi.co/api/equipment/pony")
] 

// This endpoint is the list of all the weapons(no weapon specific details)
let WeaponListUrl = "https://www.dnd5eapi.co/api/equipment-categories/weapon"


