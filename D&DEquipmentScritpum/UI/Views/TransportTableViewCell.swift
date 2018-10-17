//
//  TransportTableViewCell.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class TransportTableViewCell: UITableViewCell {

  @IBOutlet weak var transportPic: UIImageView!
  @IBOutlet weak var transportName: UILabel!
  @IBOutlet weak var transportCategory: UILabel!
  @IBOutlet weak var transportSpeed: UILabel!
  @IBOutlet weak var transportWeight: UILabel!
  @IBOutlet weak var transportNumCostAndCoinType: UILabel!
  @IBOutlet weak var transportItemNum: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
