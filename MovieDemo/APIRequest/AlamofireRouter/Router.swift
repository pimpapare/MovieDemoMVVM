//
//  Router.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire
public protocol MovieRouter: URLRequestConvertible {
    
    var url: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: AnyObject]? { get }
    var responseClass: BaseModel.Type { get }
    func asURLRequest() throws -> URLRequest
}

public enum Router: MovieRouter {
    
    case getMovieList(api_key:String,sort_by:String,page:Int)
}

extension Router {
    
    public var url: String {
        return "https://api.themoviedb.org/3/discover/"
    }
    
    public var method: Alamofire.HTTPMethod {
        
        switch self {
        case .getMovieList:
            return .get
        }
    }
    
    public var path: String {
        
        switch self {
        case .getMovieList:
            return "movie"
        }
    }
    
    public var parameters: [String: AnyObject]? {
        
        switch self {
        case .getMovieList(let api_key,let sort_by,let page):
            let params = ["api_key": api_key,
                          "sort_by": sort_by,
                          "page": page] as [String : Any]
            return params as [String : AnyObject]
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getMovieList:
            return nil
        }
    }
    
    public var rawBody: NSData {
        switch self {
        default:
            return NSData()
        }
    }
    
    public var responseClass: BaseModel.Type {
        switch self {
        case .getMovieList:
            return MovieModel.self
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: url + path)!)
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getMovieList:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        }
    }
}

enum asd: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        return urlRequest!
    }
}
