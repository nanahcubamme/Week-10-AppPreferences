//
//  ViewController.swift
//  Week 10 AppPreferences
//
//  Created by Charles Konkol on 10/26/17.
//  Copyright © 2017 RockValleyCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtEmail.text, forKey: "email")
          let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
        
    }
    
    func clear()
    {
        txtEmail.resignFirstResponder()
        txtFullName.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "fullname") != nil{
              txtFullName.text = defaults.string(forKey: "fullname")
        }
        if defaults.string(forKey: "email") != nil{
            txtEmail.text = defaults.string(forKey: "email")
        }
        if defaults.string(forKey: "bdate") != nil{
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            datepicker.setDate(date!, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

