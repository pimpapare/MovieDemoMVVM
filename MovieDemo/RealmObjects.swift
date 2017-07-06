//
//  RealmObjects.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import RealmSwift

class RealmObjects: NSObject {

    let realm = try! Realm()
    
    func writeMovieObject(id:Int, name:String, image:String){
        
        let subscribe = Subscribe()
        
        try! realm.write {
            
            subscribe.id = id
            subscribe.name = name
            subscribe.image = image
            
            realm.add(subscribe)
        }
    }
    
    func removeMovieObjects(){
        
        try! realm.write {
            realm.delete(realm.objects(Subscribe.self))
        }
    }
    
    func getMovieObjects() -> [Subscribe]{
        
//        guard realm.objects(Subscribe.self).first != nil else {
//            return getMovieObjects()
//        }
        
        let objects = realm.objects(Subscribe.self).toArray(ofType : Subscribe.self) as [Subscribe]
        return objects
    }
    
    func getMovieObjectsWithSortName() -> [Subscribe]{
        
        let sortedMovies = getMovieObjects().sorted(by: { $0.name < $1.name })
        return sortedMovies
    }
}
