//
//  ViewController.swift
//  Todoey
//
//  Created by Hector Andres Perez Villatoro on 2018-08-03.
//  Copyright © 2018 Hector Andres Perez Villatoro. All rights reserved.
//

import UIKit
//import Item

class TodoListViewController: UITableViewController {

    //let is immutable
    //var is mutable
    
    var itemArray = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Jason"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Marie"
        itemArray.append(newItem3)
        
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title //because now we are returned an Item() object
        
        //ternary operator
        //instead of if else
        //cell.accessoryType = item.done == true ? .checkmark : .none
        cell.accessoryType = item.done ? .checkmark : .none

        
        /*if(itemArray[indexPath.row].done == true)
        {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }*/
        
        return cell
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        self.tableView.reloadData() //otherwise we are not passing this to the renderer???
        
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
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            //use self
            self.itemArray.append(newItem)
            
            //use self - we are in a closure.
            //self.itemArray.append(textField.text!)
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

