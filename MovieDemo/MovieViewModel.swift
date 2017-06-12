//
//  MovieViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import IGListKit
import Alamofire

class MovieViewModel: BaseViewModel {
    
    var movie = [LoadingType.refresh.rawValue as ListDiffable]
    var isPullToRefresh = false
    
    var limit: Int?
    var offset: Int?
    var page: Int! = 0
    
    func sizeForTopOfCollectionView() -> CGFloat{
        return  UIDevice.current.orientation.isLandscape ? 0 : 20
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
                
                if self?.movie.contains(where: { $0 as? String == LoadingType.refresh.rawValue }) == true {
                    self?.movie.remove(at: 0)
                }
                
                if self?.movie.contains(where: { $0 as? String == LoadingType.loadmore.rawValue }) == true {
                    self?.movie.removeLast()
                }
                
                self?.movie.append(response)
                self?.delegate?.onDataDidLoad()
                
            } else {
                self?.delegate?.onDataDidLoadErrorWithMessage(errorMessage: (error?.localizedDescription)!)
            }
        }
    }
}
