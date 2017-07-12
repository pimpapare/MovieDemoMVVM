//
//  MovieRealmObjects.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import RealmSwift

class MovieRealmObjects: NSObject {

    let realm = try! Realm()
    
    func writeMovieObject(id:Int, name:String, image:String){
        
        let subscribe = SubscribeMovie()
        
        try! realm.write {
            
            subscribe.id = id
            subscribe.name = name
            subscribe.image = image
            
            realm.add(subscribe)
        }
    }
    
    func removeMovieObjects(){
        
        try! realm.write {
            realm.delete(realm.objects(SubscribeMovie.self))
        }
    }
    
    func getMovieObjects() -> [SubscribeMovie]{
        
//        guard realm.objects(Subscribe.self).first != nil else {
//            return getMovieObjects()
//        }
        
        let objects = realm.objects(SubscribeMovie.self).toArray(ofType : SubscribeMovie.self) as [SubscribeMovie]
        return objects
    }
    
    func getMovieObjectsWithSortName() -> [SubscribeMovie]{
        
        let sortedMovies = getMovieObjects().sorted(by: { $0.name < $1.name })
        return sortedMovies
    }
}
