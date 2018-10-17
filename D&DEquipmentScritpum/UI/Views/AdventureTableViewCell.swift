//
//  AdventureTableViewCell.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AdventureTableViewCell: UITableViewCell {
  @IBOutlet weak var adventurePic: UIImageView!
  @IBOutlet weak var adventureName: UILabel!
  @IBOutlet weak var adventureCategory: UILabel!
  @IBOutlet weak var adventureWeight: UILabel!
  @IBOutlet weak var adventureCost: UILabel!
  @IBOutlet weak var adventureItemNum: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
