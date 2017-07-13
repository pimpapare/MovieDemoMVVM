//
//  AlamofireRouterPath.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

extension AlamofireRouter {
    
    public var path: String {
        
        switch self {
        case .getMovieList:
            return "movie"
        case .getProfile(let name):
            return "users/\(name)"
        case .getPlaceList:
            return "allplace"
        }
    }
}
