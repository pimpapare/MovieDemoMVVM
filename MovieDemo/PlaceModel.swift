//
//  PlaceModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire

import RxCocoa
import RxSwift

protocol PlaceModelProtocol {
    func getPlaceList(router:AlamofireRouter, completion: @escaping (_ result: PlaceObjects?, _ error: Error?) -> Void)
    func getPlaceObject() -> [SubscribePlace]
    func setPlaceObjectToRealm(dic:[String:AnyObject])
    func removeRealmObjects()
    func queryData(query:String, completionHandler: @escaping ([SubscribePlace],Bool) -> ())
}

class PlaceModel: PlaceModelProtocol {
    
    var allPlace:[SubscribePlace] = [SubscribePlace]()
    var shownPlace:[SubscribePlace] = [SubscribePlace]()
    
    var realmObjects:PlaceRealmObjects = PlaceRealmObjects()
    
    func getPlaceList(router:AlamofireRouter, completion: @escaping (_ result: PlaceObjects?, _ error: Error?) -> Void){
        
        _ = APIRequest.request(withRouter: router, withHandler: { [weak self] (response, error) in
            
            if let response = response as? PlaceObjects {
                
                if response.statusService == false {
                    let errorTemp = NSError(domain: response.statusMessage ?? " ", code: 404, userInfo: nil)
                    completion(nil, errorTemp)
                }else{
                    completion(response, nil)
                }
            } else {
                completion(nil, error)
            }
        })
    }
    
    func setPlaceObjectToRealm(dic:[String:AnyObject]){
        
        realmObjects.writePlaceObject(id: dic["id"] as? Int ?? 0
            , name: dic["id"] as? Int ?? 0, image: dic["image"] as? String ?? "")
    }
    
    func getPlaceObject() -> [SubscribePlace]{
        
        shownPlace = realmObjects.getPlaceObjects()
        allPlace = shownPlace
        
        return shownPlace
    }
    
    func removeRealmObjects(){
        realmObjects.removePlaceObjects()
    }
    
    func queryData(query:String, completionHandler: @escaping ([SubscribePlace],Bool) -> ()){
        
        shownPlace = allPlace.filter {
            return $0.image.range(of: query) != nil
        }
        
        if shownPlace.isEmpty {
            completionHandler(allPlace,false)
        } else {
            completionHandler(shownPlace,true)
        }
    }
}
