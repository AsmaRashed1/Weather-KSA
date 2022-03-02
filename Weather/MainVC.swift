//
//  ViewController.swift
//  Weather
//
//  Created by Asma Rasheed on 14/06/1443 AH.
//

import UIKit
import Alamofire
import SwiftUI


class MainVC: UIViewController {
    
    @IBOutlet weak var cityNamrLbl: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    var cityId = "108410"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name:NSNotification.Name (rawValue : "cityValueChanged"), object: nil)
 
        getCityWheatherInfo()
        
    }
    
    func getCityWheatherInfo(){
        let params = ["id" : cityId , "appid" : "17aeb15c01e44a7fa971d8d73d2a93a5"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
        
        let JSONDicionary = result as! NSDictionary
        let main  = JSONDicionary["main"] as! NSDictionary
        var temp  = main["temp"] as! Double
        var pressure  = main["pressure"] as! Double
        var humidity  = main["humidity"] as! Double
        
        
        temp = temp - 272.15
        temp = Double(round(1000 * temp) / 1000)
        self.tempLabel.text = "\(temp)°"
        self.pressureLabel.text = "\(pressure)"
        self.humidityLabel.text = "\(humidity)"
    }
    
}
        
    }
    
    @objc func cityChanged(notification :Notification){
        if let city =   notification.userInfo?["city"]  as? City {
            cityNamrLbl.text = city.name
            cityId = city.id
            getCityWheatherInfo()
            
   
            
        }
        
    }
}



    
    


