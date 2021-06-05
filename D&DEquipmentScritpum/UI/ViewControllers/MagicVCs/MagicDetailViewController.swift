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
  @IBAction func BackButton(_ sender: UIButton) {
    performSegue(withIdentifier: "UnwindToMagic", sender: self)
  }
  
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
        page2MagicPic.image! = UIImage(imageLiteralResourceName: "NoPicture")
      }
      //page2MagicPic.image! = UIImage(imageLiteralResourceName: "hide")
      
      // we are no longer using index #
      //page2MagicIndexNum.text! = "#" + String(describing: aMod[0].index)
      page2MagicName.text! = className
      page2EquipType.text! = aMod[0].equipCat!.name
      
      if let subEquip = aMod[0].gearCat {
        page2SubEquipType.text! = subEquip.name
      } else {
        page2SubEquipType.text! = "Magic"
      }
      
      if let mWeight = aMod[0].weight {
        page2MagicWeightNum.text! = String(describing: mWeight)
      } else {
        page2MagicWeightNum.text! = "??? lbs"
      }
      
      if let costQ = aMod[0].cost {
        page2MagicCostNum.text! = String(describing: costQ.quantity)
        page2MagicCostUnit.text! = costQ.unit
      }
      
      if let mDesc = aMod[0].desc?[0] {
        var tempString: [String] = [String]()
        var tempChar: String = String()
        for loop in aMod[0].desc! {
          tempString.append(loop)
          tempChar.append(loop)
        }
        page2MagicDesc.text! = tempChar
      }
    }
  }

}
