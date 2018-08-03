//
//  ViewController.swift
//  Todoey
//
//  Created by Hector Andres Perez Villatoro on 2018-08-03.
//  Copyright © 2018 Hector Andres Perez Villatoro. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //let is immutable
    //var is mutable
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy X"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //MARK - Add New Items
    
    //important local variables and scope
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //NEEDED TO INCREASE THE SCOPE OF ALERT TEXTFIELD
        //TO BE ABLE TO PRINT ...

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "AddItem", style: .default) { (action) in
            //what will happen
            //print("Success!")
            print(textField.text!)
            
            
            //use self - we are in a closure.
            self.itemArray.append(textField.text!)
            //if the user enter nothing,
            //will add an empty string...?
            //e.g. empty cell will appear.
            
            //the change is not reflected
            //even though the item has been added to itemarray
            //do this
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            
            textField = alertTextField //pass a reference
            //to the text field that appears in the pop up.
            
            //print(alertTextField.text)
            
            //PRINT HERE DOESN'T WORK, BECAUSE ... IT IS PRINTED
            //WHEN TEXT FIELD IS ADDED TO THE ALERT.
        }
        
        alert.addAction(action)
        
       
        
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    

}

