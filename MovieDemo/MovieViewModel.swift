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
    
    var allMovies:[[String:AnyObject]] = [[String:AnyObject]]()
    var shownMovie:[[String:AnyObject]] = [[String:AnyObject]]()
    
    var isPullToRefresh:Bool = false
    var limit: Int?
    var offset: Int?
    var page: Int! = 0
    
    func setMovie() -> [[String:AnyObject]]{
        return shownMovie
    }
    
    func queryData(query:String, completionHandler: @escaping (Bool) -> ()){
        
        shownMovie = allMovies.filter {
            return ($0["title"] as? String)?.range(of:query) != nil
        }
        
        if shownMovie.isEmpty {
            shownMovie = allMovies
            completionHandler(false)
        } else {
            completionHandler(true)
        }
    }
    
    func getMovieList(){
        
        page = page + 1
        
        let router = Router.getMovieList(
            api_key: "6c26bbd637c722ffab43dc6984053411",
            sort_by: "popularity.desc",
            page: page)
        callService(router: router)
    }
    
    func callService(router:Router) {
        _ = APIRequest.request(withRouter: router, withHandler: getListMovieHandler())
    }
    
    func getListMovieHandler() -> APIRequest.completionHandler {
        
        return { [weak self] (response, error) in
            
            if let response = response as? MovieModel {
                
                for newDic in response.movies!  {
                    self?.allMovies.append(newDic)
                    self?.shownMovie.append(newDic)
                }
                
                self?.delegate?.onDataDidLoad()
                
            } else {
                self?.delegate?.onDataDidLoadErrorWithMessage(errorMessage: (error?.localizedDescription)!)
            }
        }
    }
}
