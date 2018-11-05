//
//  TransportDetailViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class TransportDetailViewController: UIViewController {

  var aMod = [MountAll]()
  @IBOutlet weak var page2TranPic: UIImageView!
  @IBOutlet weak var page2TranIndexNum: UILabel!
  @IBOutlet weak var page2TranName: UILabel!
  @IBOutlet weak var page2TranEquipType: UILabel!
  @IBOutlet weak var page2TranSubEquipType: UILabel!
  @IBOutlet weak var page2TranWeightCapacityLabel: UILabel!
  @IBOutlet weak var page2TranWeightNum: UILabel!
  @IBOutlet weak var page2TranCostNum: UILabel!
  @IBOutlet weak var page2TranCostUnit: UILabel!
  @IBOutlet weak var page2TranDesc: UITextView!
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      if let className = aMod.last?.name {
        //page2TranPic.image! = UIImage(imageLiteralResourceName: "hide")
        switch aMod.last?.name {
        case "Camel":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "camel")
        case "Mule":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "mule")
        case "Carriage":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "carriage")
        case "Chariot":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "chariot")
        case "Donkey":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "donkey")
        case "Drafthorse":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "drafthorse")
        case "Elephant":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "elephant")
        case "Horse":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "horse")
        case "Cart":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "horsecart")
        case "Mastiff":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "mastiff")
        case "Pony":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "pony")
        case "Riding Horse":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "ridinghorse")
        case "Sled":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "sled")
        case "Wagon":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "wagon")
        case "Warhorse":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "warhorse")
        case "Keelboat":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "keelboat")
        case "Longship":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "longship")
        case "Rowboat":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "rowboat")
        case "Sailing ship":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "sailingship")
        case "Warship":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "warship")
        case "Galley":
          page2TranPic.image! = UIImage(imageLiteralResourceName: "galley")
        default:
          page2TranPic.image! = UIImage(imageLiteralResourceName: "2ndPagePicPlaceHolder")
        }
        page2TranIndexNum.text! = "#" + String(describing: aMod[0].index)
        page2TranName.text! = aMod[0].name
        page2TranEquipType.text! = aMod[0].equipCat
        page2TranSubEquipType.text! = aMod[0].vehCat
        //do an if let to determine if capacity or weight is used
        //Weight is an integer and Capacity is string
        page2TranWeightNum.text! = String(describing: aMod[0].capacity!) //+ " " + String(describing: aMod[0].weight)
        page2TranCostNum.text! = String(describing: aMod[0].cost.quantity)
        page2TranCostUnit.text! = aMod[0].cost.unit
        if let desc = aMod[0].desc?[0] {
          page2TranDesc.text! = desc 
        }
      }
    }

}
