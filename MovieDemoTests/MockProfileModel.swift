//
//  MockProfileModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import XCTest
import Mockit

@testable import MovieDemo

class MockProfileModel: ProfileModel,Mock {

    var callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockProfileModel {
        return self
    }
    
    override func getProfile(router:AlamofireRouter, completion: @escaping (_ result: ProfileObjects?, _ error: Error?) -> Void){
        let object:[String:AnyObject] = ["results":[["success":"1"]] as AnyObject]
        _ = callHandler.accept(completion(ProfileObjects(withDictionary: object), nil), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
