//
//  AddTodoViewController.swift
//  TodoListApp_Part_01
//
//  Created by Raj Kumar Shahu on 2020-11-06.
//  Copyright © 2020 Centennial College. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    

    @IBOutlet weak var todoNameTextField: UITextField!
    
    var todoTableViewController : TodoListTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func addTodoTapped(_ sender: Any) {
        
        print("Tapped!!!")
    }
    

}
