//
//  TableViewController.swift
//  hw
//
//  Created by D i on 20.11.2023.
//

import UIKit

class TableViewController: UITableViewController {

    
    let persons = Person.generatePerson()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.leftBarButtonItem = self.editButtonItem
      
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if #available(iOS 14, *) {
            let person = persons[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = person.name + " " + person.surname
            content.textProperties.numberOfLines = 0
            cell.contentConfiguration = content
            
        } else {
            let person = persons[indexPath.row]
            cell.textLabel?.text = person.name + " " + person.surname
            cell.textLabel?.numberOfLines = 0
        
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
        if segue.identifier != "Detail" { return }
            
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.person = persons[indexPath.row]
            
        }
    }
   
}
