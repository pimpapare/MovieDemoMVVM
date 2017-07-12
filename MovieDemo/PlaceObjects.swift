//
//  PlaceObjects.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

class PlaceObjects: BaseModel {
    
    var places:[[String:AnyObject]]?
    var statusService:Bool?
    var statusMessage:String?
    
    var id : String!
    var itemName : String!
    var itemImage : String!
    
    var nextPlaceAvailable: Bool?
    
    var mockAuthentication:String = "170d341f4ebb62a386fb2ae64436390749917e5d"
    
    required init(withDictionary dict: [String:AnyObject]) {
        super.init(withDictionary: dict)
        self.places = dict["categories"] as? [[String : AnyObject]]
        
        //case error
        self.statusService = dict["success"] as? Bool
        self.nextPlaceAvailable = true
    }
    
    func getMovieValue(at index:Int, key:String) -> String{
        let getName = PlaceValue.init(places: places)
        return getName[index,key] as? String ?? " "
    }
}

struct PlaceValue {
    
    var places:[[String:AnyObject]]?
    subscript (_ index:Int,_ key:String) -> AnyObject?{
        return places?[index][key]
    }
}
