//
//  ArmorDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//
// next steps: Step 1) Fix other tabs by changing equipment-categry to a struct and creating an array of urls to go through (cheat)

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
  @IBAction func BackButton(_ sender: UIButton) {
    performSegue(withIdentifier: "UnwindToArmor", sender: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let className = aMod.last?.name {
      switch aMod.last?.name {
      case "Hide":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "hide")
      case "Leather":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "leather")
      case "Padded":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "padded")
      case "Studded Leather":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "studdedleather")
      case "Half Plate":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "halfplate")
      case "Chain Shirt":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "chainshirt")
      case "Scale Mail":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "scalemail")
      case "Breastplate":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "breastplate")
      case "Plate":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "plate")
      case "Chain Mail":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "chainmail")
      case "Splint":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "splint")
      case "Ring Mail":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "ringmail")
      case "Shield":
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "shield")
      case "Elven Chain":
        //cell.armorPic.image = roundedImageCorners(imageName:"chainmail")
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "elven-chain")
      case "Dragon Scale Mail":
        //cell.armorPic.image = roundedImageCorners(imageName:"splint")
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "dragon-scale-mail")
      case "Demon Armor":
        //cell.armorPic.image = roundedImageCorners(imageName:"ringmail")
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "demon-armor")
      case "Dwarven Plate":
        //cell.armorPic.image = roundedImageCorners(imageName:"shield")
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "dwarven-plate")
      case aMod.last?.name:
        if let realPic = aMod.last {
          //page2ArmorPic.image! = roundedImageCorners(imageName:"hide")
          page2ArmorPic.image! = UIImage(imageLiteralResourceName: realPic.index)
        }
      default:
        page2ArmorPic.image! = UIImage(imageLiteralResourceName: "hide")
      }
      //page2ArmorPic.image! = UIImage(imageLiteralResourceName: "hide")
      
      // we are no longer using index #
      //page2ArmorIndexNum.text! = "#" + String(describing: aMod[0].index)
      page2ArmorName.text! = aMod[0].name
      page2EquipType.text! = aMod[0].equipCat.name
      if let ACat = aMod[0].armorCat {
        page2ArmorType.text! = ACat
      } else {
        page2ArmorType.text! = "Magical"
      }
      if let Aclass = aMod[0].armorClass {
        page2ArmorBaseNum.text! = String(describing: Aclass.base)
        page2ArmorDexBonusBool.text! = String(describing: Aclass.dexBonus)
      } else {
        page2ArmorBaseNum.text! = "- - -"
        page2ArmorDexBonusBool.text! = "- - -"
      }
      
      if let aMaxBonus = aMod[0].armorClass?.maxBonus {
        page2ArmorMaxBonusNum.text! = String(describing: aMaxBonus)
      } else {
        page2ArmorMaxBonusNum.text! = "N/A"
      }
      // logic like this should be elsewhere
      if let aSTR = aMod[0].strengthMin {
        page2ArmorSTRMinNum.text! = String(describing: aSTR)
      } else {
        page2ArmorSTRMinNum.text! = "???"
      }
      
      if let aStealth = aMod[0].stealthDisadv {
        page2ArmorStealthDisadvBool.text! = String(describing: aStealth)
      } else {
        page2ArmorStealthDisadvBool.text! = "Possibly?"
      }
      
      if let aWeight = aMod[0].weight {
        page2ArmorWeightNum.text! = String(describing: aWeight) + " lbs"
      } else {
        page2ArmorWeightNum.text! = "??? lbs"
      }
      
      if let costNU = aMod[0].cost {
        page2ArmorCostNum.text! = String(describing: costNU.quantity)
        page2ArmorCostUnit.text! = costNU.unit
      } else {
        page2ArmorCostNum.text! = "??"
        page2ArmorCostUnit.text! = " GP"
      }
      
      }
    }
  //func dismiss(animated flag: Bool,
  //  completion: (() -> Void)? = nil)
  
}
