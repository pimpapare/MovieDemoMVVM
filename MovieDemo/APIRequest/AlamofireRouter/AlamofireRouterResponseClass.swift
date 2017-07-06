//
//  AlamofireRouterResponseClass.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

extension AlamofireRouter {
    
    public var responseClass: BaseModel.Type {
        switch self {
        case .getMovieList:
            return MovieObjects.self
        }
    }
}
