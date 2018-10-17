//
//  ArmorViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class ArmorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var aMod = [Armor]()
  var tempMod = [Armor]()
  var tableData: [String] = ["", ""]
  var newCell: IntegerLiteralType = 0
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for loopCount in armorTabArray { // armorTabArray
      let urlString = BaseUrl + "/" + "\(loopCount)"
      // ****  optional at end will cause program to crash!!!!
      guard let url = URL(string: urlString) else { return }
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
          print(error!.localizedDescription)
        }
        guard let data = data else { return }
        //Implement JSON decoding and parsing
        do {
          let endPointData = try JSONDecoder().decode(Armor.self, from: data)
          self.aMod.append(endPointData)
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        } catch let jsonError {
          print(jsonError)
        }
      }.resume()
    }
  }
  
  // MARK: - TableView
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var localCount = 13
    if aMod.count < localCount - 2 {
      // do nothing
    } else {
      localCount = aMod.count
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "armorCellReuseIdentifier") as! ArmorTableViewCell   
    if aMod.count != 13 {
      // do nothing, JSON hasnt loaded yet
    } else {
      cell.armorName.text! = aMod[indexPath.row].name
      // this needs to be set to indexpath.row so its not always the same pic!!
      cell.armorPic.image = UIImage(imageLiteralResourceName: "hide")
      cell.armorCategory.text! = aMod[indexPath.row].armorCat
      cell.armorWeight.text! = String(describing: aMod[indexPath.row].weight)
      cell.armorNumCost.text! = String(describing: aMod[indexPath.row].cost.quantity)
      cell.armorCostCoinType.text! = aMod[indexPath.row].cost.unit
      cell.armorItemNum.text! = String(describing: aMod[indexPath.row].index)
    }
    return cell
  }
  // clean this up/ delete unused
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let armor2Send = aMod[indexPath.row]
    tempMod.append(armor2Send)
    self.aMod[indexPath.row] = armor2Send
    self.performSegue(withIdentifier: "armor2ArmorDetailSegue", sender: self)
  }
  
  // MARK: - Segue

  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is ArmorDetailViewController {
      let vc = segue.destination as? ArmorDetailViewController
      vc?.aMod.append(tempMod.last!)
    }
  }
}









