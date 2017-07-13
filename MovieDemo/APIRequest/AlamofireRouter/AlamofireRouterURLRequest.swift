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
    
    public func setHttpHeaders(_ mutableURLRequest: inout URLRequest, headers: [String: String]?) {
        addDefaultHttpHeader(&mutableURLRequest)
        if let headers = headers {
            for each in headers.keys {
                mutableURLRequest.setValue(headers[each], forHTTPHeaderField: each)
            }
        }
    }
    
    private func addDefaultHttpHeader(_ mutableURLRequest: inout URLRequest) {
        mutableURLRequest.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
//        if let token = UserInfo.sharedInstance.token {
            mutableURLRequest.setValue("170d341f4ebb62a386fb2ae64436390749917e5d", forHTTPHeaderField: "x-access-token")
//        }
    }
    
    public func asURLRequest() throws -> URLRequest {

        switch self {
        case .getMovieList:
            var urlRequest = URLRequest(url: URL(string: baseURLMovie + path)!)
            urlRequest.httpMethod = method.rawValue
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        case .getProfile:
            var urlRequest = URLRequest(url: URL(string: baseURLProfile + path)!)
            urlRequest.httpMethod = method.rawValue
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        case .getPlaceList:
            var urlRequest = URLRequest(url: URL(string: baseURLPlace + path)!)
            urlRequest.httpMethod = method.rawValue
            setHttpHeaders(&urlRequest, headers: headers)            
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
