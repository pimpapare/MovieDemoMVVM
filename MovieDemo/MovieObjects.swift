//
//  MovieObjects.swift
//  MovieObjects
//
//  Created by pimpaporn chaichompoo on 6/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import RealmSwift

class Subscribe: Object {
    
    dynamic var id = 0
    dynamic var name = " "
    dynamic var image = " "
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        
        var array = [T]()
        
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
