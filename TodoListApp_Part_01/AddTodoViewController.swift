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
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MMM d, yyyy"
        let newToDo = Todo()
               if let todoItem =  todoNameTextField.text {
                   newToDo.todoItem = todoItem
                    newToDo.date = formatter.string(from: today)
                   todoTableViewController?.todos.append(newToDo)
                   todoTableViewController?.tableView.reloadData()
                   navigationController?.popViewController(animated: true)
               }
       
        
        print("Tapped!!!")
    }
    

}
