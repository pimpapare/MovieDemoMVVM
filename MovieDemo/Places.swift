//
//  Places.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import RealmSwift

class SubscribePlace: Object {
    
    dynamic var id = 0
    dynamic var name = 0
    dynamic var image = " "
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
