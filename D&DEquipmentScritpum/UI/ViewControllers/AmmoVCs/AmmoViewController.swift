//
//  AmmoViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AmmoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var aMod = [Ammo]()
  var tempMod = [Ammo]()
  var tableData: [String] = ["", ""]
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      for loopCount in ammoTabArray {
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
            let endPointData = try JSONDecoder().decode(Ammo.self, from: data)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // MARK: - TableView
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var localCount = 4
    if aMod.count < localCount - 2 {
      // do nothing
    } else {
      localCount = aMod.count
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ammoCellReuseIdentifier") as! AmmoTableViewCell
    if aMod.count != 4 {
      // do nothing, JSON hasnt loaded yet
    } else {
      
      cell.ammoName.text! = aMod[indexPath.row].name
      // this needs to be set to indexpath.row so its not always the same pic!!
      cell.ammoPic.image = UIImage(imageLiteralResourceName: "\(aMod[indexPath.row].name)")
      cell.ammoCategory.text! = aMod[indexPath.row].gearCat
      cell.ammoWeight.text! = String(describing: aMod[indexPath.row].weight)
      cell.ammoNumCost.text! = String(describing: aMod[indexPath.row].cost.quantity)
      cell.ammoCostCoinType.text! = aMod[indexPath.row].cost.unit
      cell.ammoItemNum.text! = String(describing: aMod[indexPath.row].index)
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let ammo2Send = aMod[indexPath.row]
    tempMod.append(ammo2Send)
    self.aMod[indexPath.row] = ammo2Send
   // self.performSegue(withIdentifier: "armor2ArmorDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is AmmoDetailViewController {
      let vc = segue.destination as? AmmoDetailViewController
      // vc?.aMod.append(tempMod.last!)
    }
  }

}
