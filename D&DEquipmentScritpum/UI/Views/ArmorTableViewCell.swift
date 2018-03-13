//
//  ArmorTableViewCell.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class ArmorTableViewCell: UITableViewCell {
  
  @IBOutlet weak var armorPic: UIImageView!
  @IBOutlet weak var armorName: UILabel!
  @IBOutlet weak var armorCategory: UILabel!
  @IBOutlet weak var armorWeight: UILabel!
  @IBOutlet weak var armorNumCost: UILabel!
  @IBOutlet weak var armorCostCoinType: UILabel!
  @IBOutlet weak var armorItemNum: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
