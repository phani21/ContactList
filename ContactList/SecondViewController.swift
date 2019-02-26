//
//  SecondViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/25/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var first_name = ""
    var last_name = ""
    var phoneNumber = ""
    var Email = ""
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding Border to the labels
        firstName.layer.borderWidth = 0.5
        lastName.layer.borderWidth = 0.5
        number.layer.borderWidth = 0.5
        email.layer.borderWidth = 0.5
        
        
        firstName.text = "First Name: " + first_name
        lastName.text = "Last name: " + last_name
        number.text = "Phone Number: " + phoneNumber
        email.text = "Email: " + Email
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
