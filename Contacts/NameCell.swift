//
//  NameCell.swift
//  Contacts
//
//  Created by John Gallaugher on 3/27/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureNameCell(personData: Data.Person) {
        nameField.text = personData.name
        companyNameField.text = personData.companyName
        phoneField.text = personData.phone
        emailField.text = personData.email
    }
}
