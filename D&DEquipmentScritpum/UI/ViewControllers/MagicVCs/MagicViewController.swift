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
  var magicUrlList = [MagicList]()
  var magicUrls = [String]()
  @IBOutlet weak var tableView: UITableView!
  @IBAction func unwind( _ seg: UIStoryboardSegue) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    getMagicList()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Functions
  func getMagicList() {
    
    let url = URL(string: magicItemListUrl)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        let endPointData = try JSONDecoder().decode(MagicList.self, from: data)
        self.magicUrlList.append(endPointData)
        DispatchQueue.main.async {
          self.magicUrls = self.magicListConvert(magicList: self.magicUrlList)
          self.getMagicModels2ndJsonCall()
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  // this will convert the object model armor list into an array of strings for just the urls
  func magicListConvert(magicList: [MagicList]) -> [String] {
    // this array will return an array of strings (list of all complete weapon urls {no headers})
    var listOfW: [String] = [String]()
    //var wL = wList
    
    for oneW in magicUrlList[0].results {
      let completeUrl = introUrl + oneW.url
      print("The complete Url is : \(completeUrl)")
      listOfW.append(completeUrl)
    }
    return listOfW
  }
  
  func getMagicModels2ndJsonCall() {
    
    for loopCount in magicUrls {
      let url = URL(string: loopCount)
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
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
    if mMod.count < 50 {
      // do nothing, JSON hasnt loaded yet
    } else {
      
      if let magItemName = mMod[indexPath.row].name {
      cell.magicName.text = magItemName }
      // this needs to be set to indexpath.row so its not always the same pic!!
      switch mMod[indexPath.row].name {
      case "Orb":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "orb")
      case "Crystal":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "crystal")
      case "Amulet":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "amulet")
      case "Rod":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "rod")
      case "Sprig of mistletoe":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "sprigofmistletoe")
      case "Wand":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "wand")
      case "Staff":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "staff")
      case "Totem":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "totem")
      case "Holy water (flask)":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "holywaterflask")
      case "Yew wand":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "yewwand")
      case "Wooden staff":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "woodenstaff")
      case "Emblem":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "emblem")
      case "Reliquary":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "reliquary")
      case "Potion of healing":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "healingpotion")
      case "Spellbook":
        cell.magicPic.image = UIImage(imageLiteralResourceName: "spellbook")
      default:
        cell.magicPic.image = UIImage(imageLiteralResourceName: "NoPicture")
      }
      //cell.magicPic.image = UIImage(imageLiteralResourceName: "\(mMod[indexPath.row].name)")
      //cell.magicCategory.text! = mMod[indexPath.row].gearCat!.name
      if let mWeight = mMod[indexPath.row].weight {
        //cell.magicWeight.text! = String(describing: mMod[indexPath.row].weight)
        cell.magicWeight.text! = String(describing: mWeight)
      } else {
        cell.magicWeight.text! = "N/A"
      }
      if let costQU = mMod[indexPath.row].cost {
        cell.magicCostAndCoinType.text! = String(describing: costQU.quantity) + " " + String(describing: costQU.unit)
      } else {
        cell.magicCostAndCoinType.text! = "N/A"
      }
      // we are no longer using index #
      //cell.magicItemNum.text! = "#" + String(describing: mMod[indexPath.row].index)
      }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let magic2Send = mMod[indexPath.row]
    tempMod.append(magic2Send)
    self.mMod[indexPath.row] = magic2Send
    self.performSegue(withIdentifier: "magic2MagicDetailSegue", sender: self)
  }
  
  // MARK: - Segue
  
  // to segue programmactically, segue from VC to VC (not cell to VC)
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.destination is MagicDetailViewController {
      let vc = segue.destination as? MagicDetailViewController
      vc?.aMod.append(tempMod.last!)
    }
  }



}
