//
//  ArmorDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class ArmorDetailViewController: UIViewController {

  var aMod = [Armor]()
  @IBOutlet weak var page2ArmorPic: UIImageView!
  @IBOutlet weak var page2ArmorIndexNum: UILabel!
  @IBOutlet weak var page2ArmorName: UILabel!
  @IBOutlet weak var page2EquipType: UILabel!
  @IBOutlet weak var page2ArmorType: UILabel!
  @IBOutlet weak var page2ArmorBaseNum: UILabel!
  @IBOutlet weak var page2ArmorDexBonusBool: UILabel!
  @IBOutlet weak var page2ArmorMaxBonusNum: UILabel!
  @IBOutlet weak var page2ArmorSTRMinNum: UILabel!
  @IBOutlet weak var page2ArmorStealthDisadvBool: UILabel!
  @IBOutlet weak var page2ArmorWeightNum: UILabel!
  @IBOutlet weak var page2ArmorCostNum: UILabel!
  @IBOutlet weak var page2ArmorCostUnit: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let className = aMod.last?.name {
      page2ArmorPic.image! = UIImage(imageLiteralResourceName: "hide")
      page2ArmorIndexNum.text! = String(describing: aMod[0].index)
      page2ArmorName.text! = aMod[0].name
      page2EquipType.text! = aMod[0].equipCat
      page2ArmorType.text! = aMod[0].armorCat
      page2ArmorBaseNum.text! = String(describing: aMod[0].armorClass.base)
      page2ArmorDexBonusBool.text! = String(describing: aMod[0].armorClass.dexBonus)
      // logic like this should be elsewhere
      if let mb:Int = aMod[0].armorClass.maxBonus {
        page2ArmorMaxBonusNum.text! = String(describing: mb)
      } else {
        page2ArmorMaxBonusNum.text! = String(describing: "null")
      }
      page2ArmorSTRMinNum.text! = String(describing: aMod[0].strengthMin)
      page2ArmorStealthDisadvBool.text! = String(describing: aMod[0].stealthDisadv)
      page2ArmorWeightNum.text! = String(describing: aMod[0].weight)
      page2ArmorCostNum.text! = String(describing: aMod[0].cost.quantity)
      page2ArmorCostUnit.text! = aMod[0].cost.unit
      }
    }
}
