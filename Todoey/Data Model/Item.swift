//
//  Item.swift
//  Todoey
//
//  Created by GUSTAFSSON MATS on 2018-12-27.
//  Copyright © 2018 GUSTAFSSON MATS. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
