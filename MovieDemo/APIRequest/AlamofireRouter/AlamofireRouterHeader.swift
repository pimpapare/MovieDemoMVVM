//
//  AlamofireRouterHeader.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public var headers: [String: String]? {
        switch self {
        case .getMovieList:
            return nil
        case .getProfile:
            return nil
        case .getPlaceList:
            return ["Authorization": "170d341f4ebb62a386fb2ae64436390749917e5d"]
        }
    }
}
