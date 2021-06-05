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
  var transportUrlList = [TransportList]()
  var transportUrls = [String]()
  var totalCount = 0
  @IBOutlet weak var tableView: UITableView!
  @IBAction func unwind( _ seg: UIStoryboardSegue) {
    
  }
  
    override func viewDidLoad() {
      super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
      getTransportList()
    }
  
  
  // MARK: - Functions
  func getTransportList() {
    
    let url = URL(string: transportListUrl)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        let endPointData = try JSONDecoder().decode(TransportList.self, from: data)
        self.transportUrlList.append(endPointData)
        DispatchQueue.main.async {
          self.transportUrls = self.transportListConvert(transportList: self.transportUrlList)
          self.getTransportModels2ndJsonCall()
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  // this will convert the object model armor list into an array of strings for just the urls
  func transportListConvert(transportList: [TransportList]) -> [String] {
    // this array will return an array of strings (list of all complete weapon urls {no headers})
    var listOfW: [String] = [String]()
    //var wL = wList
    
    for oneW in transportUrlList[0].equipment {
      let completeUrl = introUrl + oneW.url
      print("The complete Url is : \(completeUrl)")
      listOfW.append(completeUrl)
    }
    return listOfW
  }
  
  func getTransportModels2ndJsonCall() {
    
    for loopCount in transportUrls {
      let url = URL(string: loopCount)
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error != nil {
          print(error!.localizedDescription)
        }
        guard let data = data else { return }
        //Implement JSON decoding and parsing
        do {
          let endPointData = try JSONDecoder().decode(MountAll.self, from: data)
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
  
  // MARK: - TableView
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var localCount = 5
    if mMod.count < localCount  {
      // do nothing
    } else {
      localCount = mMod.count
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "transportCellReuseIdentifier") as! TransportTableViewCell
    if mMod.count < 5 {
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
        cell.transportPic.image = UIImage(imageLiteralResourceName: "NoPicture")
      }
      if let tranCat = mMod[indexPath.row].vehCat {
        cell.transportCategory.text! = tranCat
      } else {
        cell.transportCategory.text! = "Special Type??"
      }
      
      //Weight is an integer and Capacity is string
      if let tw = mMod[indexPath.row].weight {
         cell.transportWeight.text! = String(describing: tw)
      } else {
        if let cw = mMod[indexPath.row].capacity {
          cell.transportWeight.text! = cw
        } else {
          cell.transportWeight.text! = "N/A"
        }
        
      }
      
      if let ts = mMod[indexPath.row].speed {
        cell.transportSpeed.text! = String(describing: ts.quantity) + " " + String(describing: ts.unit)
      } else {
        cell.transportSpeed.text! = "N/A"
      }
      
      if let tNumCU = mMod[indexPath.row].cost {
        cell.transportNumCostAndCoinType.text! = String(describing: tNumCU.quantity) + " " + tNumCU.unit
      } else {
        cell.transportNumCostAndCoinType.text! = "?? GP"
      }
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
