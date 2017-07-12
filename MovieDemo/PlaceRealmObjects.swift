//
//  PlaceRealmObjects.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import RealmSwift

class PlaceRealmObjects: NSObject {
    
    let realm = try! Realm()
    
    func writePlaceObject(id:Int, name:Int, image:String){
        
        let subscribe = SubscribePlace()
        
        try! realm.write {
            
            subscribe.id = id
            subscribe.name = name
            subscribe.image = image
            
            realm.add(subscribe)
        }
    }
    
    func removePlaceObjects(){
        
        try! realm.write {
            realm.delete(realm.objects(SubscribePlace.self))
        }
    }
    
    func getPlaceObjects() -> [SubscribePlace]{
        
        let objects = realm.objects(SubscribePlace.self).toArray(ofType : SubscribePlace.self) as [SubscribePlace]
        return objects
    }
    
    func getPlaceObjectsWithSortName() -> [SubscribePlace]{
        
        let sortedPlaces = getPlaceObjects().sorted(by: { $0.name < $1.name })
        return sortedPlaces
    }
}
