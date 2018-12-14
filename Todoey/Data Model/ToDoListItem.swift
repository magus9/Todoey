//
//  ToDoListCell.swift
//  Todoey
//
//  Created by GUSTAFSSON MATS on 2018-12-13.
//  Copyright © 2018 GUSTAFSSON MATS. All rights reserved.
//

import Foundation

class ToDoListItem : Codable{
    var title : String = ""
    var done : Bool = false
  
    init(text : String){
        self.title = text
        self.done = false
    }
    
    init(text : String, checked : Bool){
        self.title = text
        self.done = checked
    }

}
