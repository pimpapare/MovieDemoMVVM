//
//  AlamofireRouter.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

public enum AlamofireRouter: AlamofireRouterProtocol {

    case getMovieList(api_key:String,sort_by:String,page:Int)
}
