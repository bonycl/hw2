//
//  secondVC.swift
//  hw
//
//  Created by D i on 20.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    var user: String!
    var userEmail: [String] = []
    var userPhone: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = person.name + " " + person.surname
        mainLabel.numberOfLines = 1
        emailTextFiled.isUserInteractionEnabled = false
        phoneTextField.isUserInteractionEnabled = false
        
        emailTextFiled.text = "\(person.email)"
        phoneTextField.text = "\(person.phoneNumber)"
        
       
        
    }
    
    

}
