//
//  PlaceViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/11/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class PlaceViewModel {
    
    var viewInterfaceProtocol:PlaceCollectionViewController!
    var modelProtocol:PlaceModelProtocol!
    var model:PlaceModel = PlaceModel()
    
    let baseFunction:BaseFunction = BaseFunction()
    var page: Int! = 0
    
    required init(view:PlaceCollectionViewController, viewControllerModel:PlaceModelProtocol) {
        self.viewInterfaceProtocol = view
        self.modelProtocol = viewControllerModel
    }
    
    func getShownPlace() -> [SubscribePlace]{
        return model.getPlaceObject()
    }
    
    func getPlaceList() {
        
        let router = AlamofireRouter.getPlaceList        
        self.modelProtocol.getPlaceList(router: router) { (result,error) in
            
            if let e = error {
                self.viewInterfaceProtocol.onDataDidLoadErrorWithMessage(errorMessage: e.localizedDescription)
            }else{
                
                if let resultPlace = result?.places{
                    for newDic in resultPlace {
                        self.modelProtocol.setPlaceObjectToRealm(dic: newDic)
                    }
                }
                
                self.viewInterfaceProtocol.reloadWithData(newData: self.model.getPlaceObject())
                self.viewInterfaceProtocol.onDataDidLoad()
            }
        }
    }
    
    func verifyForRemoveRealmObjects(forceRemove:Bool){
        
        if baseFunction.isInternetAvailable() || forceRemove == true{
            model.removeRealmObjects()
        }
    }
    
    func verifyQueryData(query:String, completionHandler: @escaping (Bool) -> ()){
        
        model.queryData(query: query) { (result,Bool) in
            self.viewInterfaceProtocol.reloadWithData(newData: result)
            completionHandler(Bool)
        }
    }
}
