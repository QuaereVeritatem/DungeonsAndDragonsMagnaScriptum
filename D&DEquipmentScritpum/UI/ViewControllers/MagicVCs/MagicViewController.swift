//
//  MagicViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var mMod = [Magic]()
  var tempMod = [Magic]()
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for loopCount in magicTabArray {
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
          let endPointData = try JSONDecoder().decode(Magic.self, from: data)
          self.mMod.append(endPointData)
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
    if mMod.count < localCount  {
      // do nothing
    } else {
      localCount = mMod.count
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "magicCellReuseIdentifier") as! MagicTableViewCell
    if mMod.count < 5 {
      // do nothing, JSON hasnt loaded yet
    } else {
      
      cell.magicName.text! = mMod[indexPath.row].name
      // this needs to be set to indexpath.row so its not always the same pic!!
      //cell.magicPic.image = UIImage(imageLiteralResourceName: "\(mMod[indexPath.row].name)")
      cell.magicCategory.text! = mMod[indexPath.row].gearCat
      cell.magicWeight.text! = String(describing: mMod[indexPath.row].weight)
      cell.magicCostAndCoinType.text! = String(describing: mMod[indexPath.row].cost.quantity) + " " + mMod[indexPath.row].cost.unit
      cell.magicItemNum.text! = String(describing: mMod[indexPath.row].index)
 
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let magic2Send = mMod[indexPath.row]
    tempMod.append(magic2Send)
    self.mMod[indexPath.row] = magic2Send
    // self.performSegue(withIdentifier: "armor2ArmorDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is MagicDetailViewController {
      let vc = segue.destination as? MagicDetailViewController
      // vc?.aMod.append(tempMod.last!)
    }
  }



}
