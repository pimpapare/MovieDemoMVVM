//
//  MovieViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire

import RxCocoa
import RxSwift

protocol MovieModelProtocol {
    func getMovieList(router:AlamofireRouter, completion: @escaping (_ result: MovieObjects?, _ error: Error?) -> Void)
    func getMovieObject() -> [Subscribe]
    func setMovieObjectToRealm(dic:[String:AnyObject])
    func removeRealmObjects()
    func queryData(query:String, completionHandler: @escaping ([Subscribe],Bool) -> ())
}

class MovieModel: MovieModelProtocol {
    
    var allMovies:[Subscribe] = [Subscribe]()
    var shownMovie:[Subscribe] = [Subscribe]()
    
    var realmObjects:RealmObjects = RealmObjects()
    
    func getMovieList(router:AlamofireRouter, completion: @escaping (_ result: MovieObjects?, _ error: Error?) -> Void){
        
        _ = APIRequest.request(withRouter: router, withHandler: { [weak self] (response, error) in
            
            if let response = response as? MovieObjects {
                
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
    
    func setMovieObjectToRealm(dic:[String:AnyObject]){
        
        realmObjects.writeMovieObject(id: dic["id"] as? Int ?? 0
            , name: dic["title"] as? String ?? "", image: dic["backdrop_path"] as? String ?? "")
    }
    
    func getMovieObject() -> [Subscribe]{
        
        shownMovie = realmObjects.getMovieObjects()
        allMovies = shownMovie
        
        return shownMovie
    }
    
    func removeRealmObjects(){
        realmObjects.removeMovieObjects()
    }
    
    func queryData(query:String, completionHandler: @escaping ([Subscribe],Bool) -> ()){
        
        shownMovie = allMovies.filter {
            return $0.name.range(of: query) != nil
        }
        
        if shownMovie.isEmpty {
            completionHandler(allMovies,false)
        } else {
            completionHandler(shownMovie,true)
        }
    }
}
