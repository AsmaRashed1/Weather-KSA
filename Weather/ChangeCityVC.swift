//
//  ChangeCityVC.swift
//  Weather
//
//  Created by Asma Rasheed on 17/06/1443 AH.
//

import UIKit

class ChangeCityVC: UIViewController  {
 

    var citiesArray = [
        City (name: "Riyadh", id: "108410"),
        City (name: "Dammam", id: "110336"),
        City (name: "Makkah", id: "104515"),
        City (name: "Jeddah", id:" 105343"),
        City (name: "Hail", id: "106281"),
        City (name: "Medina", id: "109223"),
        City (name: "Abha", id: "110690"),
        City (name: "Khamis Mushait", id: "105072"),
        City (name: "jizan", id: "105299"),
        City (name: "Hafar Al-Batin", id: "106297"),
        City (name: "Buraydah", id: "107304"),
        City (name: "Dhahran", id: "107797"),
        City (name: "Khobar", id: "109323"),
        City (name: "Arar", id: "108512"),
        City (name: "Al Bahah", id: "109953"),

    ]

    

    var selectedCity : City?
    
    @IBOutlet weak var citiesPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self

    }
    
    @IBAction func editCity(_ sender: Any) {
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil,userInfo: ["city":city])
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}
extension ChangeCityVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
}
