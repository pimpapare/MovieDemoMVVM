//
//  AlamofireRouterParameters.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

extension AlamofireRouter {

    public var parameters: [String: Any]? {
        
        switch self {
        case .getMovieList(let api_key,let sort_by,let page):
            let params = ["api_key": api_key,
                          "sort_by": sort_by,
                          "page": page] as [String : Any]
            return params as [String : Any]
        case .getPlaceList:
            return nil
        }
    }
}
