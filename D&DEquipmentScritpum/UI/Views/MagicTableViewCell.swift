//
//  MagicTableViewCell.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class MagicTableViewCell: UITableViewCell {

  @IBOutlet weak var magicPic: UIImageView!
  @IBOutlet weak var magicName: UILabel!
  @IBOutlet weak var magicCategory: UILabel!
  @IBOutlet weak var magicWeight: UILabel!
  @IBOutlet weak var magicCostAndCoinType: UILabel!
  @IBOutlet weak var magicItemNum: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
