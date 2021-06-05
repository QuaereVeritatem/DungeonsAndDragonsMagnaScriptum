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
  @IBAction func BackButton(_ sender: UIButton) {
    performSegue(withIdentifier: "UnwindToAmmo", sender: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let className = aMod.last?.name {
      page2AmmoPic.image! = UIImage(imageLiteralResourceName: "\(className)")
    } else {
      // use default image (which has been set on storyboard)
    }
    page2AmmoName.text! = aMod[0].name
    page2EquipType.text! = aMod[0].equipCat.name
    if let subEquip = aMod[0].gearCat {
      page2SubEquipType.text! = subEquip.name
    } else {
      page2SubEquipType.text! = "Magic"
    }
    if let aWeight = aMod[0].weight {
      page2AmmoWeightNum.text! = String(describing: aWeight) + " lbs"
    } else {
      page2AmmoWeightNum.text! = "Unknown"
    }
    
    if let ammoCost = aMod[0].cost {
      page2AmmoCostNum.text! = String(describing: ammoCost.quantity)
      page2AmmoCostUnit.text! = " " + ammoCost.unit
    } else {
      page2AmmoCostNum.text! = "??"
      page2AmmoCostUnit.text! = " GP"
    }
  }
}




