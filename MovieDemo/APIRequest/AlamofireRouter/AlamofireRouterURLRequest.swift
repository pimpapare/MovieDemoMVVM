//
//  AlamofireRouterURLRequest.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: baseURL + path)!)
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getMovieList:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        }
    }
}
