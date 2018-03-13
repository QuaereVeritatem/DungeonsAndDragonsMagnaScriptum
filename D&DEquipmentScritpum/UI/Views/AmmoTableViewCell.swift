//
//  AmmoTableViewCell.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AmmoTableViewCell: UITableViewCell {
  @IBOutlet weak var ammoPic: UIImageView!
  @IBOutlet weak var ammoName: UILabel!
  @IBOutlet weak var ammoCategory: UILabel!
  @IBOutlet weak var ammoWeight: UILabel!
  @IBOutlet weak var ammoNumCost: UILabel!
  @IBOutlet weak var ammoCostCoinType: UILabel!
  @IBOutlet weak var ammoItemNum: UILabel!
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
