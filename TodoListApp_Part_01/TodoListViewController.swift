//
//  ViewController.swift
//  TodoListApp_Part_01
//
//  Created by Raj Kumar Shahu on 2020-11-05.
//  Copyright © 2020 Centennial College. All rights reserved.
//

import UIKit




class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoListItemLabel: UILabel!
    @IBOutlet weak var todoDateLabel: UILabel!
    @IBOutlet weak var todoDoneSwitch: UISwitch!
    
}

var cellIndex = 0

class TodoListTableViewController: UITableViewController {
    var todos : [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = Todo()
        toDo1.todoItem = "Web Tech M3"
        toDo1.date = "Wednesday November 11, 2020"
        toDo1.detail = "Integration of at least half of the screens (use cases) with the web service."

        let toDo2 = Todo()
        toDo2.todoItem = "Enterprise Tech M3"
        toDo2.date = "Thursday November 12, 2020"
        toDo2.detail = "Web Server with Implementation of all of use-cases. Integration with Mobile App (at least one use case – e.g. List All. Demonstration of functionality (e.g. using Postman)"
        
        let toDo3 = Todo()
        toDo3.todoItem = "iOS Todo List App"
        toDo3.date = "Friday November 13, 2020"
        toDo3.detail = "The app interface will allow the user to enter a list of Todos (or tasks) on the main screen. Include a second screen that displays the Todo Details."

        let toDo4 = Todo()
        toDo4.todoItem = "Android google map"
        toDo4.date = "Sunday November 8, 2020"
        toDo4.detail = "Develop an Android app that allows customers to find the location and address of the pizza restaurants. "
        
        let toDo5 = Todo()
        toDo5.todoItem = "UI/UX Milestone 3"
        toDo5.date = "Sunday November 15, 2020"
        toDo5.detail = "Create a usability testing plan for your proposed design. Run user testing sessions and summarize your findings "

        todos = [toDo1,toDo2, toDo3, toDo4, toDo5]
       
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! TodoTableViewCell
        
        let todoList =  todos[indexPath.row]
        
        cell.todoListItemLabel?.text = todoList.todoItem
        
        cell.todoDateLabel?.text = todoList.date
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addViewController = segue.destination as? AddTodoViewController {
            addViewController.todoTableViewController = self
        }
        
        if let todoDetailViewController = segue.destination as? TodoDetailViewController {
            todoDetailViewController.todoItem = todos[cellIndex].todoItem
            todoDetailViewController.date = todos[cellIndex].date
            todoDetailViewController.detail = todos[cellIndex].detail
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.row
        
        performSegue(withIdentifier: "TodoDetail", sender: self)
    }
    
    
    
}





//extension String {
//    func strikeThrough() -> NSAttributedString {
//        let attributeString =  NSMutableAttributedString(string: self)
//        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
//        return attributeString
//    }
//}

