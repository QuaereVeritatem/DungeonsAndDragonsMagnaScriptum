//
//  MagicDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {

  var aMod = [Magic]()
  @IBOutlet weak var page2MagicPic: UIImageView!
  @IBOutlet weak var page2MagicIndexNum: UILabel!
  @IBOutlet weak var page2MagicName: UILabel!
  @IBOutlet weak var page2EquipType: UILabel!
  @IBOutlet weak var page2SubEquipType: UILabel!
  @IBOutlet weak var page2MagicWeightNum: UILabel!
  @IBOutlet weak var page2MagicCostNum: UILabel!
  @IBOutlet weak var page2MagicCostUnit: UILabel!
  @IBOutlet weak var page2MagicDesc: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let className = aMod.last?.name {
      switch aMod.last?.name {
      case "Orb":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "orb")
      case "Crystal":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "crystal")
      case "Amulet":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "amulet")
      case "Rod":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "rod")
      case "Sprig of mistletoe":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "sprigofmistletoe")
      case "Wand":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "wand")
      case "Staff":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "staff")
      case "Totem":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "totem")
      case "Holy water (flask)":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "holywaterflask")
      case "Yew wand":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "yewwand")
      case "Wooden staff":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "woodenstaff")
      case "Emblem":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "emblem")
      case "Reliquary":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "reliquary")
      case "Potion of healing":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "healingpotion")
      case "Spellbook":
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "spellbook")
      default:
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "orb")
      }
      //page2MagicPic.image! = UIImage(imageLiteralResourceName: "hide")
      page2MagicIndexNum.text! = "#" + String(describing: aMod[0].index)
      page2MagicName.text! = aMod[0].name
      page2EquipType.text! = aMod[0].equipCat
      page2SubEquipType.text! = aMod[0].gearCat
      page2MagicWeightNum.text! = String(describing: aMod[0].weight)
      page2MagicCostNum.text! = String(describing: aMod[0].cost.quantity)
      page2MagicCostUnit.text! = aMod[0].cost.unit
      page2MagicDesc.text! = aMod[0].desc[0]
    }
    }

}
