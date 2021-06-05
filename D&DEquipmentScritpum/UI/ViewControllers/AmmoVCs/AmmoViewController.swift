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
  var ammoUrlList = [AmmoList]()
  var ammoUrls = [String]()
  var tableData: [String] = ["", ""]
  @IBOutlet weak var tableView: UITableView!
  @IBAction func unwind( _ seg: UIStoryboardSegue) {
    
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getArmorList()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // MARK: - Functions
  func getArmorList() {
    
    let url = URL(string: ammoListUrl)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        let endPointData = try JSONDecoder().decode(AmmoList.self, from: data)
        self.ammoUrlList.append(endPointData)
        DispatchQueue.main.async {
          self.ammoUrls = self.ammoListConvert(ammoList: self.ammoUrlList)
          self.getAmmoModels2ndJsonCall()
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  // this will convert the object model armor list into an array of strings for just the urls
  func ammoListConvert(ammoList: [AmmoList]) -> [String] {
    // this array will return an array of strings (list of all complete weapon urls {no headers})
    var listOfW: [String] = [String]()
    //var wL = wList
    
    for oneW in ammoUrlList[0].equipment {
      let completeUrl = introUrl + oneW.url
      print("The complete Url is : \(completeUrl)")
      listOfW.append(completeUrl)
    }
    return listOfW
  }
  
  func getAmmoModels2ndJsonCall() {
    
    for loopCount in ammoUrls {
      let url = URL(string: loopCount)
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
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
  
  // MARK: - TableView
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var localCount = 4
    if aMod.count > 1 {
      localCount = aMod.count
      print("The ammo count is: \(aMod.count)")
    } else {
      // do nothing
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ammoCellReuseIdentifier") as! AmmoTableViewCell
    var aName: String = "Hasnt loaded yet"
    
    if (aMod.count == 6) {
      cell.ammoName.text! = aMod[indexPath.row].name
      //print("Else as in ammo ocunt >0")
    
    
    // causing issues with no pics matching names for magical ammo
    let cellPic = UIImage(imageLiteralResourceName: "\(aMod[indexPath.row].name)")
    cell.ammoPic.image = cellPic
      
    if let ammoCat = aMod[indexPath.row].gearCat {
      cell.ammoCategory.text! = ammoCat.name
    } else {
      cell.ammoCategory.text! = "Magical"
    }
        
    // WEIGHT
    if let aWeight = aMod[indexPath.row].weight {
      cell.ammoWeight.text! = String(describing: aWeight) + " lbs"
    } else {
      cell.ammoWeight.text! = "?? lbs"
    }
      
    // COST
    if let ammoCT = aMod[indexPath.row].cost {
      cell.ammoNumCost.text! = String(describing: ammoCT.quantity)
      cell.ammoCostCoinType.text! = ammoCT.unit
    } else {
      cell.ammoNumCost.text! = "??"
      cell.ammoCostCoinType.text! = "GP"
    }
    }
    //self.tableView.reloadData()
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let ammo2Send = aMod[indexPath.row]
    tempMod.append(ammo2Send)
    self.aMod[indexPath.row] = ammo2Send
    self.performSegue(withIdentifier: "ammo2AmmoDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is AmmoDetailViewController {
      let vc = segue.destination as? AmmoDetailViewController
      vc?.aMod.append(tempMod.last!)
    }
  }

}
