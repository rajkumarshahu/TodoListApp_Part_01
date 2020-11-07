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
    let detail: String
}

var todoLists = [
    Todo(todoItem: "Web Tech M3", date: "Wednesday November 11, 2020", detail: "Integration of at least half of the screens (use cases) with the web service."),
    Todo(todoItem: "Enterprise Tech M3", date: "Thursday November 12, 2020", detail: "Web Server with Implementation of all of use-cases. Integration with Mobile App (at least one use case – e.g. List All. Demonstration of functionality (e.g. using Postman)"),
    Todo(todoItem: "iOS Todo List App", date: "Friday November 13, 2020", detail: "The app interface will allow the user to enter a list of Todos (or tasks) on the main screen. Include a second screen that displays the Todo Details."),
    Todo(todoItem: "Android google map", date: "Sunday November 8, 2020", detail: "Develop an Android app that allows customers to find the location and address of the pizza restaurants. "),
    Todo(todoItem: "UI/UX Milestone 3", date: "Friday November 13, 2020",  detail: "Create a usability testing plan for your proposed design. Run user testing sessions and summarize your findings")
]

var cellIndex = 0



class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoListItemLabel: UILabel!
    @IBOutlet weak var todoDateLabel: UILabel!
    
    @IBOutlet weak var todoDoneSwitch: UISwitch!
    
}



class TodoListTableViewController: UITableViewController {
    
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addViewController = segue.destination as? AddTodoViewController {
            addViewController.todoTableViewController = self
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        
        performSegue(withIdentifier: "TodoDetail", sender: self)
    }
    
}





extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

