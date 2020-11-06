//
//  ViewController.swift
//  TodoListApp_Part_01
//
//  Created by Raj Kumar Shahu on 2020-11-05.
//  Copyright © 2020 Centennial College. All rights reserved.
//

import UIKit



struct Todo {
    let todoItem : String
    let date : String
}

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoListItemLabel: UILabel!
    @IBOutlet weak var todoDateLabel: UILabel!
    
    @IBOutlet weak var todoDoneSwitch: UISwitch!
    
}



class TodoListTableViewController: UITableViewController {
    
    
    let todoLists = [
        Todo(todoItem: "Web Tech M3", date: "Wednesday November 11, 2020"),
        Todo(todoItem: "Enterprise Tech M3", date: "Thursday November 12, 2020"),
        Todo(todoItem: "iOS Todo List App", date: "Friday November 13, 2020"),
        Todo(todoItem: "Android google map", date: "Sunday November 8, 2020"),
        Todo(todoItem: "UI/UX Milestone 3", date: "Friday November 13, 2020")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! TodoTableViewCell
        
        let todoList =  todoLists[indexPath.row]
        
        cell.todoListItemLabel?.text = todoList.todoItem
        
        cell.todoDateLabel?.text = todoList.date
        
        return cell
        
    }
    
    
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

