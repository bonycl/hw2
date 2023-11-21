//
//  TableViewController.swift
//  hw
//
//  Created by D i on 20.11.2023.
//

import UIKit

class TableViewController: UITableViewController {

    let firstNames = ["John", "Jane", "Michael", "Emily", "David", "Sarah", "Christopher", "Olivia", "Matthew", "Emma"]
    let lastNames = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor"]
    
    var number = 0
    
    let randomEmails = [
        "john.doe@example.com",
        "jane.smith@example.com",
        "michael.jones@example.com",
        "emily.wilson@example.com",
        "david.miller@example.com",
        "sarah.davis@example.com",
        "chris.williams@example.com",
        "olivia.moore@example.com",
        "matthew.taylor@example.com",
        "emma.brown@example.com",
        "alexander.clark@example.com",
        "isabella.hill@example.com",
        "ryan.ross@example.com",
        "ava.cooper@example.com",
        "daniel.baker@example.com",
        "grace.fisher@example.com",
        "jacob.hall@example.com",
        "mia.carter@example.com",
        "noah.martin@example.com",
        "ella.walker@example.com"
    ]
    
    let randomPhoneNumbers = [ "1234567", "2345678", "3456789", "4567890", "5678901", "6789012", "7890123", "8901234", "9012345", "0123456", "9876543", "8765432", "7654321", "6543210", "5432109", "4321098", "3210987", "2109876", "1098765", "9870123" ]
    
    let anotherNumber = "1234567"
    
    var people: [String] = []
    var emailDetail: [String] = []
    var phoneDetail: [String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        generatePeople()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if #available(iOS 14, *) {
            var content = cell.defaultContentConfiguration()
            content.text = people[indexPath.row]
            content.textProperties.numberOfLines = 0
            
            content.imageProperties.maximumSize = CGSize(width: 43, height: 43)
            cell.contentConfiguration = content
            
        } else {
            cell.textLabel?.text = people[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.imageView?.image = UIImage(named: people[indexPath.row])
            cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            cell.imageView?.clipsToBounds = true
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.contentMode = .scaleAspectFit

        }
    
        return cell
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.user = people[indexPath.row]
            detailVC.userEmail = emailDetail
            detailVC.userPhone = phoneDetail
            
        }
    }
   
    func generatePeople () {
        for _ in 1...20 {
            let firstName = firstNames.randomElement() ?? ""
            let secondName = lastNames.randomElement() ?? ""
            let rndEmail = randomEmails.randomElement() ?? ""
            let rndPhone = randomPhoneNumbers.randomElement() ?? ""
            
            let person = "\(firstName) \(secondName)"
            
            let newPersonArray = people.contains("\(person)")
            if !newPersonArray {
                people.append(person)
                emailDetail.append(rndEmail)
                phoneDetail.append(rndPhone)
            } else {
                print(" found a copy of person ")
            }
            
            number += 1 
            print(number)
        }
        print("cycles - \(number)")
        print("people - \(people.self.count)")
        print("emails - \(emailDetail.self.count)")
        print("phones - \(phoneDetail.self.count)")
    }
}
