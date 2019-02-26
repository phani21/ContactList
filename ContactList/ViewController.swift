//
//  ViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/25/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct?]()
    var indexOfSelectedCell : Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay!.givenname
        cell.detailTextLabel?.text = contactToDisplay!.number
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexOfSelectedCell = indexPath.row
        performSegue(withIdentifier: "seg", sender: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewControllerReference = segue.destination as! SecondViewController
        if let contactDetail = contacts[indexOfSelectedCell] {
            print(contactDetail.givenname)
            print(indexOfSelectedCell)
            secondViewControllerReference.first_name = contactDetail.givenname
            secondViewControllerReference.last_name = contactDetail.familyname
            secondViewControllerReference.phoneNumber = contactDetail.number
            secondViewControllerReference.Email = contactDetail.email
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Authorization Succesful")
            }
        }
        fetchContacts()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchContacts(){
        
        let key = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            
            let name = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            if let email = contact.emailAddresses.first?.value {
            let contactToAppend = ContactStruct(givenname: name, familyname: familyName, number: number!, email: email as String)
            self.contacts.append(contactToAppend)
            }
            else
            {
                let contacttoAppend = ContactStruct(givenname: name, familyname: familyName, number: number!, email: "None")
                self.contacts.append(contacttoAppend)
            }
        }
        
    }
    
    
    
}




