//
//  TransportViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 2/19/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class TransportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var mMod = [MountAll]()
  var tempMod = [MountAll]()
  //var mEqMod = [MountEquip]()
  //var tempEqMod = [MountEquip]()
  var totalCount = 0
  // 191-200 & 251-256 is mount
  // 201-250           is mountequipment
  @IBOutlet weak var tableView: UITableView!
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      for loopCount in transportTabArray { // transportTabArray
        let urlString = BaseUrl + "/" + "\(loopCount)" //this was (loopcount + 1)
        // ****  optional at end will cause program to crash!!!!
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          if error != nil {
            print(error!.localizedDescription)
          }
          guard let data = data else { return }
          //Implement JSON decoding and parsing
          do {
             let endPointData = try JSONDecoder().decode(MountAll.self, from: data)
              self.mMod.append(endPointData)
              self.totalCount = self.totalCount + 1
            
            //self.mMod.append(endPointData)
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
    var localCount = 5
    if totalCount < localCount  { // this was localCount - 2
      // do nothing
    } else {
      localCount = totalCount
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "transportCellReuseIdentifier") as! TransportTableViewCell
    if totalCount < 5 {
      // do nothing, JSON hasnt loaded yet
    } else {
      cell.transportName.text! = mMod[indexPath.row].name
        // this needs to be set to indexpath.row so its not always the same pic!!
        // cell.transportPic.image = UIImage(imageLiteralResourceName: "\(mEqMod[indexPath.row].name)")
      switch mMod[indexPath.row].name {
      case "Camel":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "camel")
      case "Mule":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "mule")
      case "Carriage":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "carriage")
      case "Chariot":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "chariot")
      case "Donkey":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "donkey")
      case "Horse, draft":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "drafthorse")
      case "Elephant":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "elephant")
      case "Horse":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "horse")
      case "Cart":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "horsecart")
      case "Mastiff":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "mastiff")
      case "Pony":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "pony")
      case "Horse, riding":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "ridinghorse")
      case "Sled":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "sled")
      case "Wagon":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "wagon")
      case "Warhorse":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "warhorse")
      case "Keelboat":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "keelboat")
      case "Longship":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "longship")
      case "Rowboat":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "rowboat")
      case "Sailing ship":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "sailingship")
      case "Warship":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "warship")
      case "Galley":
        cell.transportPic.image = UIImage(imageLiteralResourceName: "galley")
      default:
        cell.transportPic.image = UIImage(imageLiteralResourceName: "2ndPagePicPlaceHolder")
      }
      cell.transportCategory.text! = mMod[indexPath.row].vehCat
      
      //Weight is an integer and Capacity is string
      if let tw = mMod[indexPath.row].weight {
         cell.transportWeight.text! = String(describing: tw)
      } else {
        if let cw = mMod[indexPath.row].capacity {
            cell.transportWeight.text! = cw
        }
      }
      
      if let ts = mMod[indexPath.row].speed {
         cell.transportSpeed.text! = String(describing: ts.quantity) + " " + String(describing: ts.unit)
      }
      cell.transportNumCostAndCoinType.text! = String(describing: mMod[indexPath.row].cost.quantity) + " " + mMod[indexPath.row].cost.unit
      cell.transportItemNum.text! = "#" + String(describing: mMod[indexPath.row].index)
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //determine top of model here with if statement  *******
    let tran2Send = mMod[indexPath.row]
    tempMod.append(tran2Send)
    self.mMod[indexPath.row] = tran2Send
    self.performSegue(withIdentifier: "transport2TransportDetailSegue", sender: self)

  }

  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is TransportDetailViewController {
      let vc = segue.destination as? TransportDetailViewController
      vc?.aMod.append(tempMod.last!)
    }
  }

    

}
