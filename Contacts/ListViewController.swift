//
//  ListViewController.swift
//  Contacts
//
//  Created by John Gallaugher on 3/27/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data.getData {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToEdit" {
            let destination = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            destination.person = data.personArray[indexPath.row]
        } else {
            if let selectedRow = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedRow, animated: true)
            }
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        print("*** This nown works!!!")
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    @IBAction func unwindFromDetailViewController(sender: UIStoryboardSegue) {
        if let source = sender.source as? DetailViewController, let newPerson = source.person {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                data.personArray[selectedIndexPath.row] = newPerson
                //tableView.reloadData()
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                data.personArray.append(newPerson)
                let newIndexPath = IndexPath(row: data.personArray.count-1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NameCell
        cell.configureNameCell(personData: data.personArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}

