//
//  AlamofireRouterMethod.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public var method: Alamofire.HTTPMethod {
        
        switch self {
        case .getMovieList:
            return .get
        case .getPlaceList:
            return .get
        }
    }
}
