//
//  Category.swift
//  Todoey
//
//  Created by GUSTAFSSON MATS on 2018-12-27.
//  Copyright © 2018 GUSTAFSSON MATS. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    let items = List<Item>()
}
