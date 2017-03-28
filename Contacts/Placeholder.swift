//
//  Placeholder.swift
//  Contacts
//
//  Created by John Gallaugher on 3/27/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Placeholder {
    
    struct Person {
        var name: String
        var email: String
        var phone: String
        var companyName: String
    }
    
    var personArray = [Person]()
    
    func getData(completed: @escaping () -> ()) {
        let URL = "https://jsonplaceholder.typicode.com/users"
        Alamofire.request(URL).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("success")
                let json = JSON(value)
                for index in 0...json.count-1 {
                    let name = json[index]["name"].stringValue
                    let email = json[index]["email"].stringValue
                    let phone = json[index]["phone"].stringValue
                    let companyName = json[index]["company"]["name"].stringValue
                    // Let's test this by printing to the console:
                    print("Name \(index) is \(name)")
                    self.personArray.append(Person(name: name, email: email, phone: phone, companyName: companyName))
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
