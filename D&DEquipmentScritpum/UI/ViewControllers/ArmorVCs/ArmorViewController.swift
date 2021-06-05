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
  var armorUrlList = [ArmorList]()
  var armorUrls = [String]()
  var tableData: [String] = ["", ""]
  var newCell: IntegerLiteralType = 0
  @IBOutlet weak var tableView: UITableView!
  @IBAction func unwind( _ seg: UIStoryboardSegue) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    getArmorList()
  }
  
  // MARK: - Functions
  func getArmorList() {
    
    let url = URL(string: ArmorListUrl)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        let endPointData = try JSONDecoder().decode(ArmorList.self, from: data)
        self.armorUrlList.append(endPointData)
        DispatchQueue.main.async {
          self.armorUrls = self.armorListConvert(armorList: self.armorUrlList)
          self.getArmorModels2ndJsonCall()
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  // this will convert the object model armor list into an array of strings for just the urls
  func armorListConvert(armorList: [ArmorList]) -> [String] {
    // this array will return an array of strings (list of all complete weapon urls {no headers})
    var listOfW: [String] = [String]()
    //var wL = wList
    
    for oneW in armorUrlList[0].equipment {
      let completeUrl = introUrl + oneW.url
      print("The complete Url is : \(completeUrl)")
      listOfW.append(completeUrl)
    }
    return listOfW
  }
  
  func getArmorModels2ndJsonCall() {
    
    for loopCount in armorUrls {
      let url = URL(string: loopCount)
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error != nil {
          print(error!.localizedDescription)
        }
        guard let data = data else { return }
        //Implement JSON decoding and parsing
        do {
          let endPointData = try JSONDecoder().decode(Armor.self, from: data)
          self.aMod.append(endPointData)
          DispatchQueue.main.async {
            //self.tableView.reloadData()
            // update the labels for Armor (magical and non-magical)
            for armor1 in self.aMod {
              //self.updateTheLabels(armor: armor1)
              //self.tableView.reloadData()
            }
            self.tableView.reloadData()
          }
        } catch let jsonError {
          print(jsonError)
        }
      }.resume()
    }
  }
  
  /// this will change all the labels to the appropriate json data...we can tie this to a label from pickerview  [Command + Option + /] to do easy comments
  /// - Parameter armor: Armor used
  func updateTheLabels(armor: Armor)  {
    var allPropLabel: String = ""
    let introUrl: String = "dnd5eapi.co"
    let possiblyLong : Int64
    let possiblyProperties: String
    // this will be the armor thats brought in as a parameter
    let currArmor: Armor
    // this will be the armor we are returning
    var updatedArmor: Armor
    // this will be used as a flag to help populate the weapon with no info
    var weapon123: Bool = false
   
    // name of armor
    let currArmorName = armor.name
    
    // optional unbind for armor category (will determine if its magical or non-magical)
    if let currArmorCat = armor.armorCat {
      print("Armor is non-magical")
    } else {
      let currArmorCat = "Magical"
    }
    
    // this logic chooses which icon will represent the weapon  (club is default)
    // maybe have special icon for: whip,net,war-pick,scythe, vicious-weapon
    /*
    armor.index = UIImage(imageLiteralResourceName: "UrlGroup")
    weapon123 = false
    
    
    if let newIndex = weapon.index {
      
      // checking index name to see if sword icon applies
      let possibleSword = ["sword","dagger","scimitar","rapier","defender","flame-tongue","blade","slayer", "vorpal","frost-brand","holy-avenger","nine-lives-stealer","vicious-weapon","weapon"]
      let combinedSwordResult = possibleSword.contains(where: newIndex.contains)
      if combinedSwordResult {
        WeaponIcon.image = UIImage(imageLiteralResourceName: "sword")
          if newIndex == "weapon" {
          weapon123 = true
        }
      }
      
      // checking index name to see if spear icon applies
      let possibleSpear = ["spear","javelin","lance","pike","trident","halberd"]
      let combinedSpearResult = possibleSpear.contains(where: newIndex.contains)
      if combinedSpearResult {
        WeaponIcon.image = UIImage(imageLiteralResourceName: "spear")
      }
      
      // checking index name to see if club icon applies
      let possibleClub = ["club","bat","staff","whip","rod"]
      let combinedClubResult = possibleClub.contains(where: newIndex.contains)
      if combinedClubResult {
       WeaponIcon.image = UIImage(imageLiteralResourceName: "club")
      }
       
      // checking index name to see if mace icon applies
      let possibleMace = ["mace","morningstar","hammer","glaive","flail","dwarven"]
      let combinedMaceResult = possibleMace.contains(where: newIndex.contains)
      if combinedMaceResult {
       WeaponIcon.image = UIImage(imageLiteralResourceName: "mace")
      }
      
      // checking index name to see if axe icon applies
      let possibleAxe = ["axe","sickle","war-pick","halberd"]
      let combinedAxeResult = possibleAxe.contains(where: newIndex.contains)
      if combinedAxeResult {
       WeaponIcon.image = UIImage(imageLiteralResourceName: "axe")
      }
            
      // checking index name to see if bow icon applies
      let possibleBow = ["bow","arrow","sling","gun","net","dart"]
      let combinedBowResult = possibleBow.contains(where: newIndex.contains)
      if combinedBowResult {
       WeaponIcon.image = UIImage(imageLiteralResourceName: "bow")
      }
      
      // this is the default and in case something new added or we missed a weapon
      if WeaponIcon.image == UIImage(imageLiteralResourceName: "UrlGroup") {
        WeaponIcon.image = UIImage(imageLiteralResourceName: "club")
      }
    } */
    
    //make an array of special weapons that have no info so they can all have magic put in for labels/properties
    
    // if non-magical armor, info filled out so go with JSON...if magical, go with defaults
    /*
    if let currArmorQuantity = armor.cost {
      updatedArmor.url(init: String(describing: currArmorQuantity.quantity))
      if let currArmorUnit = armor.cost?.unit {
        let currArmorCostLabel = String(describing: currArmorQuantity) + " " + currArmorUnit
      }
    } */
    
    if let currArmorWeight = armor.weight {
      let currArmorWeightLabel = String(describing: currArmorWeight)  + " lbs"
    } else {
      let currArmorWeight = "?? lbs"
      let currArmorWeightLabel = currArmorWeight
    }
    
    let currArmorUrl = armor.url
    let currArmorCompleteUrl = introUrl + currArmorUrl
    let currArmorCompleteUrlLabel = currArmorCompleteUrl
    //let updatedArmor.url = currArmorCompleteUrlLabel
    
    self.tableView.reloadData()
    //return updatedArmor
  }
  
  func roundedImageCorners(imageName: String) -> UIImage {
    
    // Set up for Rounded corners
    let view = UIView()
    view.backgroundColor = .white
    let armorImage = UIImage(named: imageName)
    let myImageView:UIImageView = UIImageView()
    myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    myImageView.frame.size.width = 108
    myImageView.frame.size.height = 155
    myImageView.center = self.view.center
    myImageView.image = armorImage
    
    // Round the corners
    myImageView.layer.cornerRadius = 20
    myImageView.clipsToBounds = true
    view.addSubview(myImageView)
    self.view = view
    
    return myImageView.image!
  }
  
  // MARK: - TableView
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var localCount = 13
    if aMod.count <  2 {
      // do nothing
    } else {
      localCount = aMod.count
      print("in the else of numberOfRowsInSection the aMod.count = \(aMod.count)")
    }
    return localCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "armorCellReuseIdentifier") as! ArmorTableViewCell   
    if aMod.count < 6 {
      // do nothing, JSON hasnt loaded yet
    } else {
      //updateTheLabels(armor: aMod[indexPath.row])
      cell.armorName.text! = aMod[indexPath.row].name
      // this needs to be set to indexpath.row so its not always the same pic!!
      switch aMod[indexPath.row].name {
      case "Hide":
        //cell.armorPic.image = roundedImageCorners(imageName:"hide")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "hide")
      case "Leather":
        //cell.armorPic.image = roundedImageCorners(imageName:"leather")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "leather")
      case "Padded":
        //cell.armorPic.image = roundedImageCorners(imageName:"padded")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "padded")
      case "Studded Leather":
        //cell.armorPic.image = roundedImageCorners(imageName:"studdedleather")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "studded-leather")
      case "Half Plate":
        //cell.armorPic.image = roundedImageCorners(imageName:"halfplate")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "half-plate")
      case "Chain Shirt":
        //cell.armorPic.image = roundedImageCorners(imageName:"chainshirt")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "chain-shirt")
      case "Scale Mail":
        //cell.armorPic.image = roundedImageCorners(imageName:"scalemail")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "scale-mail")
      case "Breastplate":
        //cell.armorPic.image = roundedImageCorners(imageName:"breastplate")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "breastplate")
      case "Plate":
        //cell.armorPic.image = roundedImageCorners(imageName:"plate")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "plate")
      case "Chain Mail":
        //cell.armorPic.image = roundedImageCorners(imageName:"chainmail")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "chain-mail")
      case "Splint":
        //cell.armorPic.image = roundedImageCorners(imageName:"splint")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "splint")
      case "Ring Mail":
        //cell.armorPic.image = roundedImageCorners(imageName:"ringmail")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "ring-mail")
      case "Shield":
        //cell.armorPic.image = roundedImageCorners(imageName:"shield")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "shield")
      case "Elven Chain":
        //cell.armorPic.image = roundedImageCorners(imageName:"chainmail")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "elven-chain")
      case "Dragon Scale Mail":
        //cell.armorPic.image = roundedImageCorners(imageName:"splint")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "dragon-scale-mail")
      case "Demon Armor":
        //cell.armorPic.image = roundedImageCorners(imageName:"ringmail")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "demon-armor")
      case "Dwarven Plate":
        //cell.armorPic.image = roundedImageCorners(imageName:"shield")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "dwarven-plate")
      case aMod[indexPath.row].name:
        let realPic = aMod[indexPath.row].index
        if realPic == aMod[indexPath.row].index {
          //cell.armorPic.image = roundedImageCorners(imageName:"hide")
          cell.armorPic.image = UIImage(imageLiteralResourceName: realPic)
        } 
      default:
        //cell.armorPic.image = roundedImageCorners(imageName:"hide")
        cell.armorPic.image = UIImage(imageLiteralResourceName: "hide")
    }
      //cell.armorPic.image = UIImage(imageLiteralResourceName: "hide")
      
      if let armorCat = aMod[indexPath.row].armorCat {
        cell.armorCategory.text! = armorCat
      }
      
      if let armorWeight = aMod[indexPath.row].weight {
        cell.armorWeight.text! = String(describing: armorWeight) + " lbs"
      } else {
        cell.armorWeight.text! = "Magical"
      }
      
      if let armorNumCU = aMod[indexPath.row].cost {
        cell.armorNumCost.text! = String(describing: armorNumCU.quantity)
        cell.armorCostCoinType.text! = armorNumCU.unit
      } else {
        cell.armorNumCost.text! = "??"
        cell.armorCostCoinType.text! = "GP"
      }
 
      // we are no longer using index #
      //cell.armorItemNum.text! = "#" + String(describing: aMod[indexPath.row].index)
      print("in the else of cellForRowAt the aMod.count = \(aMod.count)")
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









