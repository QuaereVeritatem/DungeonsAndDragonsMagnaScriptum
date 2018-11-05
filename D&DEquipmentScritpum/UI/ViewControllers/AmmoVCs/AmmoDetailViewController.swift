//
//  AmmoDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AmmoDetailViewController: UIViewController {

  var aMod = [Ammo]()
  @IBOutlet weak var page2AmmoPic: UIImageView!
  @IBOutlet weak var page2AmmoIndexNum: UILabel!
  @IBOutlet weak var page2AmmoName: UILabel!
  @IBOutlet weak var page2EquipType: UILabel!
  @IBOutlet weak var page2SubEquipType: UILabel!
  @IBOutlet weak var page2AmmoWeightNum: UILabel!
  @IBOutlet weak var page2AmmoCostNum: UILabel!
  @IBOutlet weak var page2AmmoCostUnit: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    if let className = aMod.last?.name {
      page2AmmoPic.image! = UIImage(imageLiteralResourceName: "\(className)")
      page2AmmoIndexNum.text! = "#" + String(describing: aMod[0].index)
      page2AmmoName.text! = aMod[0].name
      page2EquipType.text! = aMod[0].equipCat
      page2SubEquipType.text! = aMod[0].gearCat
      page2AmmoWeightNum.text! = String(describing: aMod[0].weight)
      page2AmmoCostNum.text! = String(describing: aMod[0].cost.quantity)
      page2AmmoCostUnit.text! = aMod[0].cost.unit
      }
     }
}




