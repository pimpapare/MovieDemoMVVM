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

class MovieViewModel: BaseViewModel {
    
    var allMovies:[Subscribe] = [Subscribe]()
    //:[[String:AnyObject]] = [[String:AnyObject]]()
    var shownMovie:[Subscribe] = [Subscribe]()
    //:[[String:AnyObject]] = [[String:AnyObject]]()
    
    var realmObjects:RealmObjects = RealmObjects()
    let baseFunction:BaseFunction = BaseFunction()
    
    var isPullToRefresh:Bool = false
    var limit: Int?
    var offset: Int?
    var page: Int! = 0
    
    func setMovie() -> [Subscribe]{
        
        // Sort objects not good for sperating toload object from API
        //shownMovie = realmObjects.getMovieObjectsWithSortName()
      
        shownMovie = realmObjects.getMovieObjects()
        allMovies = shownMovie
        
        return shownMovie
    }
    
    func queryData(query:String, completionHandler: @escaping (Bool) -> ()){
        
        shownMovie = allMovies.filter {
            return $0.name.range(of: query) != nil
        }
        
        if shownMovie.isEmpty {
            shownMovie = allMovies
            completionHandler(false)
        } else {
            completionHandler(true)
        }
    }
    
    func getCollectionCellSize() -> CGSize{
        let cell_size:CGFloat = Constants.deviceWidth/3 - 15
        return CGSize(width: cell_size, height: cell_size)
    }
    
    func getMovieList(){
        
        page = page + 1
        
        let router = AlamofireRouter.getMovieList(api_key: "6c26bbd637c722ffab43dc6984053411",
            sort_by: "popularity.desc", page: page)
        
        callService(router: router)
    }
    
    func callService(router:AlamofireRouter) {
        _ = APIRequest.request(withRouter: router, withHandler: getListMovieHandler())
    }
    
    func getListMovieHandler() -> APIRequest.completionHandler {
        
        return { [weak self] (response, error) in
            
            if let response = response as? MovieModel {
                
                for newDic in response.movies!  {
                    self?.setMovieObjectToRealm(id: newDic["id"] as? Int ?? 0, name: newDic["title"] as? String ?? "", image: newDic["backdrop_path"] as? String ?? "")
                }

                self?.delegate?.onDataDidLoad()
                self?.delegate?.testChangingName()
                
            } else {
                self?.delegate?.onDataDidLoadErrorWithMessage(errorMessage: (error?.localizedDescription)!)
            }
        }
    }
    
    func setMovieObjectToRealm(id:Int, name:String, image:String){
        realmObjects.writeMovieObject(id: id, name: name, image: image)
    }
    
    func verifyForRemoveRealmObjects(){
        
        if baseFunction.isInternetAvailable() {
            realmObjects.removeMovieObjects()
        }
    }
}
