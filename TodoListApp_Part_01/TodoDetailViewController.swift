//
//  TodoDetailViewController.swift
//  TodoListApp_Part_01
//
//  Created by Raj Kumar Shahu on 2020-11-06.
//  Copyright © 2020 Centennial College. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var todoTitleLabel: UILabel!
    
    @IBOutlet weak var todoNameTextView: UITextField!
    
    @IBOutlet weak var todoDetailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTitleLabel.text = todoLists[cellIndex].todoItem + "'s Details"
        todoNameTextView.text = todoLists[cellIndex].todoItem
        todoDetailTextView.text = todoLists[cellIndex].detail
        
    }
    
}
