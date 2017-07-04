//
//  AlamofireRouterProtocol.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Alamofire

public protocol AlamofireRouterProtocol: URLRequestConvertible {
    
    var baseURL: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var responseClass: BaseModel.Type { get }
    func asURLRequest() throws -> URLRequest
}

