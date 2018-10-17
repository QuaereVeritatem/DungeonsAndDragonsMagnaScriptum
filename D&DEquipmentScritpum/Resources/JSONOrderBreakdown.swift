//
//  JSONOrderBreakdown.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/4/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

// 1A) Armor {38-50},
// 1B) Adventure Gear -> Standard Gear {51-53, 59, 65-88, 94-104, 112-133, 135-153},
// 1C) Adventure Gear -> Ammunition {54-57},
// 1D) Adventure Gear -> Holy Symbol {58, 93, 134},
// 1E) Adventure Gear -> Arcane Focus {60-64},
// 1F) Adventure Gear -> Druidic focus {89-92},
// 1G) Adventure Gear -> Kit {105-111}
// 1H) Adventure Gear -> Equipment Pack {154-160}
// 1I) Tools -> Artisans Tolls {161-177}
// 1J) Tools -> Gaming Sets {178-179}
// 1K) Tools -> Musical Instrument {180-189}
// 1L) Tools -> Other Tools {190-191}
// 1M) Mounts and vehicles -> Mounts and other animals {192-200}
// 1N) Mounts and vehicles -> Tack, Harness, and Drawn Vehicles {201-250} //226-234 is armor for animals
// 1O) Mounts and Vehicles -> waterborne vehicles {251-256}


// Armor Tab: {38-50}
// Ammo Tab: {54-57}
// Magic Tab: {58, 60-64, 89-92, 93, 99, 129, 134, 145 }
// Adventure Tab: {51-53,59,65-88, 94-98, 100-111, 112-128, 130-133, 135-144, 146-191}
// {51,65,67,68,69,70,71,74,75 [id, index, name, equipcat, gearcat, cost{}, weight, url]
// 52,59,66,72,73 [id, index, name, equipcat, gearcat, cost{}, weight, desc[], url]
// 53 [id, index, name, equipcat, gearcat, cost{}, desc[], url]         //no weight
// 75-88, 94-98, 100-111, 112-128, 130-133, 135-144, 146-191}





// Transport Tab: {192-256}

// [1-37 are weapons] so are {99,101,}
// ** item 178 is the dice item!!
