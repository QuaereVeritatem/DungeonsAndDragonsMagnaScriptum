//
//  AdventureDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AdventureDetailViewController: UIViewController {

  var aMod = [AdvenGear]()
  @IBOutlet weak var page2AdvPic: UIImageView!
  @IBOutlet weak var page2AdvIndexNum: UILabel!
  @IBOutlet weak var page2AdvName: UILabel!
  @IBOutlet weak var page2AdvEquipType: UILabel!
  @IBOutlet weak var page2AdvSubEquipType: UILabel!
  @IBOutlet weak var page2AdvWeightNum: UILabel!
  @IBOutlet weak var page2AdvCostNum: UILabel!
  @IBOutlet weak var page2AdvCostUnit: UILabel!
  @IBOutlet weak var page2AdvDesc: UITextView!
  @IBAction func BackButton(_ sender: UIButton) {
    performSegue(withIdentifier: "UnwindToAdventure", sender: self)
  }
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      if let className = aMod.last?.name {
        //page2AdvPic.image! = UIImage(imageLiteralResourceName: "hide")
        switch aMod.last?.name {
        case "Acid (vial)":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "acidvial")
        case "Perfume (vial)":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "perfumevial")
        case "Orb":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "orb")
        case "Crystal":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "crystal")
        case "Amulet":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "amulet")
        case "Rod":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "rod")
        case "Sprig of mistletoe":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "sprigofmistletoe")
        case "Wand":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "wand")
        case "Staff":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "staff")
        case "Totem":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "totem")
        case "Holy water (flask)":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "holywaterflask")
        case "Yew wand":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "yewwand")
        case "Wooden staff":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "woodenstaff")
        case "Emblem":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "emblem")
        case "Reliquary":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "reliquary")
        case "Potion of healing":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "healingpotion")
        case "Spellbook":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "spellbook")
        default:
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "NoPicture")
        }
      }
      page2AdvName.text! = aMod[0].name
      page2AdvEquipType.text! = aMod[0].equipCat.name
      
      if let advSubEquipType = aMod[0].gearCat {
        page2AdvSubEquipType.text! = advSubEquipType.name
      } else {
        if let advSubEquipType = aMod[0].toolCat {
          page2AdvSubEquipType.text! = advSubEquipType
        } else {
          page2AdvSubEquipType.text! = "??"
        }
      }
      
      if let advWeight = aMod[0].weight {
        page2AdvWeightNum.text! = String(describing: advWeight) + " lbs"
      } else {
        page2AdvWeightNum.text! = "- -"
      }
      
      if let advCostNU = aMod[0].cost {
        page2AdvCostNum.text! = String(describing: advCostNU.quantity)
        page2AdvCostUnit.text! = advCostNU.unit
      } else {
        page2AdvCostNum.text! = "?? "
        page2AdvCostUnit.text! = "GP"
      }
      
      if let advDesc = aMod[0].desc {
        var tempString: [String] = [String]()
        var tempChar: String = String()
        for loop in aMod[0].desc! {
          tempString.append(loop)
          tempChar.append(loop)
        }
        page2AdvDesc.text! = tempChar
      }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
