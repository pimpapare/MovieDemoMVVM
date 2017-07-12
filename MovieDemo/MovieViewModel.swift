//
//  MovieViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class MovieViewModel {
    
    var viewInterfaceProtocol:MovieTableViewControllerProtocol!
    var modelProtocol:MovieModelProtocol!
    var model:MovieModel = MovieModel()
    
    let baseFunction:BaseFunction = BaseFunction()
    var page: Int! = 0
    
    required init(view:MovieTableViewControllerProtocol, viewControllerModel:MovieModelProtocol) {
        self.viewInterfaceProtocol = view
        self.modelProtocol = viewControllerModel
    }
    
    func getShownMovie() -> [SubscribeMovie]{
        return model.getMovieObject()
    }
    
    func getMovieList() {
        
        page = page + 1
        let router = AlamofireRouter.getMovieList(api_key: "6c26bbd637c722ffab43dc6984053411",
                                                  sort_by: "popularity.desc", page: page)
        
        self.modelProtocol.getMovieList(router: router) { (result,error) in
            
            if let e = error {
                self.viewInterfaceProtocol.onDataDidLoadErrorWithMessage(errorMessage: e.localizedDescription)
            }else{
                
                if let resultMovie = result?.movies{
                    for newDic in resultMovie {
                        self.modelProtocol.setMovieObjectToRealm(dic: newDic)
                    }
                }
                
                //self.modelProtocol.setMovieObject()
                self.viewInterfaceProtocol.reloadWithData(newData: self.model.getMovieObject())
                self.viewInterfaceProtocol.onDataDidLoad()
            }
        }
    }
    
    func verifyScaleForReloadData(distance:CGFloat, querySucess:Bool){
        
        if distance < 150 && querySucess == false{
            self.getMovieList()
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
