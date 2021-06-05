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
  var advGearUrlList = [AdvGearList]()
  var advGearUrls = [String]()
  @IBAction func unwind( _ seg: UIStoryboardSegue) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    getAdvGearList()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Functions
  func getAdvGearList() {
    
    let url = URL(string: advGearListurl)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        let endPointData = try JSONDecoder().decode(AdvGearList.self, from: data)
        self.advGearUrlList.append(endPointData)
        DispatchQueue.main.async {
          self.advGearUrls = self.advGearListConvert(advGearList: self.advGearUrlList)
          self.getAdvGearModels2ndJsonCall()
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  // this will convert the object model armor list into an array of strings for just the urls
  func advGearListConvert(advGearList: [AdvGearList]) -> [String] {
    // this array will return an array of strings (list of all complete weapon urls {no headers})
    var listOfW: [String] = [String]()
    //var wL = wList
    
    for oneW in advGearUrlList[0].equipment {
      let completeUrl = introUrl + oneW.url
      print("The complete Url is : \(completeUrl)")
      listOfW.append(completeUrl)
    }
    return listOfW
  }
  
  func getAdvGearModels2ndJsonCall() {
    
    for loopCount in advGearUrls {
      let url = URL(string: loopCount)
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error != nil {
          print(error!.localizedDescription)
        }
        guard let data = data else { return }
        //Implement JSON decoding and parsing
        do {
          let endPointData = try JSONDecoder().decode(AdvenGear.self, from: data)
          self.advMod.append(endPointData)
          print("The last name/index added is: \(self.advMod.last!.name)/\(self.advMod.last!.index)")
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
      switch advMod[indexPath.row].name {
      case "Acid (vial)":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "acidvial")
      case "Perfume (vial)":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "perfumevial")
      case "Orb":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "orb")
      case "Crystal":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "crystal")
      case "Amulet":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "amulet")
      case "Rod":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "rod")
      case "Sprig of mistletoe":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "sprigofmistletoe")
      case "Wand":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "wand")
      case "Staff":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "staff")
      case "Totem":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "totem")
      case "Holy water (flask)":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "holywaterflask")
      case "Yew wand":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "yewwand")
      case "Wooden staff":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "woodenstaff")
      case "Emblem":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "emblem")
      case "Reliquary":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "reliquary")
      case "Potion of healing":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "healingpotion")
      case "Spellbook":
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "spellbook")
      
      default:
        cell.adventurePic.image = UIImage(imageLiteralResourceName: "NoPicture")
      }
      
      if let gc = advMod[indexPath.row].gearCat?.name {
         cell.adventureCategory.text! = gc
      }
      
      // crash was here on indexpath[row 13, Basket?] [FIX]
      if let aw =  advMod[indexPath.row].weight {
         cell.adventureWeight.text! = String(describing:aw) + " lbs"
      }
      if let advCost = advMod[indexPath.row].cost {
        cell.adventureCost.text! = String(describing: advCost.quantity) + " " + advCost.unit
      }
      
      // we are no longer using index #
      //cell.adventureItemNum.text! = "#" + String(describing: advMod[indexPath.row].index)
      
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let adv2Send = advMod[indexPath.row]
    tempMod.append(adv2Send)
    self.advMod[indexPath.row] = adv2Send
    self.performSegue(withIdentifier: "adventure2AdventureDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is AdventureDetailViewController {
      let vc = segue.destination as? AdventureDetailViewController
      vc?.aMod.append(tempMod.last!)
    }
  }



}
