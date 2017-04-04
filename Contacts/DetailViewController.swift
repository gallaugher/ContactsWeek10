//
//  DetailViewController.swift
//  Contacts
//
//  Created by John Gallaugher on 4/3/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var person: Data.Person?
    var comingFromRowClick: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()

        if person == nil {
            person = Data.Person(name: "", email: "", phone: "", companyName: "")
        } else {
            nameField.text = person?.name
            companyField.text = person?.companyName
            phoneField.text = person?.phone
            emailField.text = person?.email
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        person?.name = nameField.text!
        person?.companyName = companyField.text!
        person?.email = emailField.text!
        person?.phone = phoneField.text!
    }
    

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }

}
