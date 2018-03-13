//
//  ViewController.swift
//  D&DEquipmentScritpum
//
//  Created by Robert Martin on 1/22/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//
// armorVC, AmmoVC, MagicVC, AdventureVC, TransportVC
// armorDetailVC, AmmoDetailVC, MagicDetailVC, AdventureDetailVC, TransportDetailVC
import UIKit

class ViewController: UIViewController {
  
  var aMod = [Armor]()

  override func viewDidLoad() {
    super.viewDidLoad()
    for loopCount in 37...49 {
      let urlString = BaseUrl + "/" + "\(loopCount + 1)"
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
          print(self.aMod)
          DispatchQueue.main.async {
            // this calls it everytime..instead lets call when we update(didselectRow)
            //self.updateTheLabels(weapon: endPointData)
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


}

