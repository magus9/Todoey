//
//  ViewController.swift
//  Todoey
//
//  Created by GUSTAFSSON MATS on 2018-11-28.
//  Copyright © 2018 GUSTAFSSON MATS. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray : [ToDoListItem] = [ToDoListItem]()
    
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath!)
        
        tableView.delegate = self
        
        loadItems()
        
        
    }
    
    //MARK - Tableview Datasource Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeue cell with identifier "ToDoItemCell"
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell")
        let item = itemArray[indexPath.row]
        
        dequeueCell?.textLabel?.text = item.title
        dequeueCell!.accessoryType = item.done ? .checkmark : .none

        return dequeueCell!
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoListItem = itemArray[indexPath.row]
        
        todoListItem.done = !todoListItem.done

        saveItems()
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //MARK - Add  new Items
    
    fileprivate func saveItems() {
        do{
            let encoder = PropertyListEncoder()
            
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let  alert = UIAlertController(title: "Add New Todoey  Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
            self.itemArray.append(ToDoListItem(text: textField.text!))
            
             self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField=alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([ToDoListItem].self, from: data)
            } catch {
                print("Error decoding array, \(error)")
            }
        }
    }
    
}

