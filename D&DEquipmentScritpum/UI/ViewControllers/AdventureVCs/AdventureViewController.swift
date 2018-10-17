//
//  AdventureViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class AdventureViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  var advMod = [AdvenGear]()
  var tempMod = [AdvenGear]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for loopCount in adventureTabArray {
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
          let endPointData = try JSONDecoder().decode(AdvenGear.self, from: data)
          self.advMod.append(endPointData)
          DispatchQueue.main.async {
            //print("The count total is  \(self.advMod.count)")
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
    if advMod.count < localCount {
      // do nothing
    } else {
      localCount = advMod.count
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "adventureCellReuseIdentifier") as! AdventureTableViewCell
    if advMod.count < 6 {
      // do nothing, JSON hasnt loaded yet
    } else {
      
      cell.adventureName.text! = advMod[indexPath.row].name
      //cell.adventurePic.image = UIImage(imageLiteralResourceName: "\(advMod[indexPath.row].name)")
      if let gc = advMod[indexPath.row].gearCat {
         cell.adventureCategory.text! = gc   //this could be nil!
      }
      if let aw =  advMod[indexPath.row].weight {
         cell.adventureWeight.text! = String(describing:aw)
      }
      cell.adventureCost.text! = String(describing: advMod[indexPath.row].cost.quantity) + " " + advMod[indexPath.row].cost.unit
      cell.adventureItemNum.text! = String(describing: advMod[indexPath.row].index)
      
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let adv2Send = advMod[indexPath.row]
    tempMod.append(adv2Send)
    self.advMod[indexPath.row] = adv2Send
    // self.performSegue(withIdentifier: "armor2ArmorDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is AdventureDetailViewController {
      let vc = segue.destination as? AdventureDetailViewController
      // vc?.aMod.append(tempMod.last!)
    }
  }



}
