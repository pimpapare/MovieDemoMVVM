//
//  MockMovieModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/7/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import XCTest
import Mockit

@testable import MovieDemo

class MockMovieModel: MovieModel,Mock {

    var callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockMovieModel {
        return self
    }
    
    override func getMovieList(router:AlamofireRouter, completion: @escaping (_ result: MovieObjects?, _ error: Error?) -> Void) {
        let object:[String:AnyObject] = ["results":[["success":"1"]] as AnyObject]
        _ = callHandler.accept(completion(MovieObjects(withDictionary: object), nil), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    override func setMovieObjectToRealm(dic:[String:AnyObject]) {
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: dic)
    }
    
    override func getMovieObject() -> [SubscribeMovie] {
        return [SubscribeMovie]()
    }
    
    override func queryData(query:String, completionHandler: @escaping ([SubscribeMovie],Bool) -> ()) {
        let object:[SubscribeMovie] = [SubscribeMovie()]
        _ = callHandler.accept(completionHandler(object, true), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
