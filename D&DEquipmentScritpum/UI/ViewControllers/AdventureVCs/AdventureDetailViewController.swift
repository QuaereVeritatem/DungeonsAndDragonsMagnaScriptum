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
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      if let className = aMod.last?.name {
        //page2AdvPic.image! = UIImage(imageLiteralResourceName: "hide")
        switch aMod.last?.name {
        case "Acid (vial)":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "acidvial")
        case "Perfume (vial)":
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "perfumevial")
        
        default:
          page2AdvPic.image! = UIImage(imageLiteralResourceName: "2ndPagePicPlaceHolder")
        }
        page2AdvIndexNum.text! = "#" + String(describing: aMod[0].index)
        page2AdvName.text! = aMod[0].name
        page2AdvEquipType.text! = aMod[0].equipCat
        if aMod[0].index > 160 && (aMod[0].index < 192) {
          page2AdvSubEquipType.text! = aMod[0].toolCat!
        } else {
          page2AdvSubEquipType.text! = aMod[0].gearCat!
        }
        
        page2AdvWeightNum.text! = String(describing: aMod[0].weight)
        page2AdvCostNum.text! = String(describing: aMod[0].cost.quantity)
        page2AdvCostUnit.text! = aMod[0].cost.unit
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
