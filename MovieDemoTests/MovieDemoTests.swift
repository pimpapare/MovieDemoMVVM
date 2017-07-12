//
//  MovieDemoTests.swift
//  MovieDemoTests
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import XCTest
import Mockit
import Hamcrest
import Alamofire

@testable import MovieDemo

class MockMovieInterfaceProtocol : MovieTableViewControllerProtocol, Mock {
    
    var callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockMovieInterfaceProtocol {
        return self
    }
    
    func onDataDidLoad() {
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func onDataDidLoadErrorWithMessage(errorMessage: String) {
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func reloadWithData(newData:[SubscribeMovie]) {
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: newData)
    }
}

class MovieDemoTests: XCTestCase {
    
    var mockModel: MockMovieModel! // model
    var movieViewModel: MovieViewModel! // view model
    var mockMovieInterfaceProtocol: MockMovieInterfaceProtocol! // protocol
    
    override func setUp() {
        super.setUp()
        
        mockModel = MockMovieModel(testCase: self)
        mockMovieInterfaceProtocol = MockMovieInterfaceProtocol(testCase: self)
        movieViewModel = MovieViewModel(view: mockMovieInterfaceProtocol, viewControllerModel: mockModel)
    }
    
    func testCallOnDataDidLoad() {
        
        let router = AlamofireRouter.getMovieList(api_key: AnyValue.string,
                                                  sort_by: AnyValue.string, page: AnyValue.int)
        
        movieViewModel.getMovieList()
        mockModel.verify(verificationMode: Once()).getMovieList(router: router, completion: { _ in })
        //mockModel.verify(verificationMode: Never()).getMovieList(router: router, completion: { _ in })
    }
    
    func testResultOnDataDidLoadResponse() {
        
        let router = AlamofireRouter.getMovieList(api_key: AnyValue.string,
                                                  sort_by: AnyValue.string, page: AnyValue.int)
        
        let _ = mockModel.when().call(withReturnValue: mockModel.getMovieList(router: router, completion: { (result,error) in
            let stringJson = "[[\"success\": 1]]"
            assertThat("\(String(describing: (result?.movies)!))", equalTo(stringJson))
        }))
    }
    
    func testCallOnDataDidLoadErrorWithMessage(errorMessage: String) {
        

    }
    
    func testResultOnDataDidLoadErrorWithMessage(errorMessage: String) {
        
        
    }
    
    func testReloadWithData(newData:[SubscribeMovie]) {
        
        movieViewModel.verifyQueryData(query: AnyValue.string) { (success) in
            self.mockMovieInterfaceProtocol.verify(verificationMode: Once()).reloadWithData(newData:[SubscribeMovie{}])
        }
    }
    
    func testResponseQueryData() {
        
        let testString = "wonder women"
        
        movieViewModel.verifyQueryData(query: testString) { (success) in
            self.mockModel.queryData(query: testString, completionHandler: { (result, success2) in
                assertThat("\(String(describing: (success2)))", equalTo("true"))
            })
        }
    }
    
    func testCallQueryData() {
        
        movieViewModel.verifyQueryData(query: AnyValue.string) { (success) in
            self.mockModel.queryData(query: AnyValue.string, completionHandler: { (result, success2) in
                self.mockModel.verify(verificationMode: Once()).queryData(query: AnyValue.string, completionHandler: { _ in })
            })
        }
    }
    
    func testVerifyScaleForReloadData(){
        
        movieViewModel.verifyScaleForReloadData(distance: 149, querySucess: false)

        let router = AlamofireRouter.getMovieList(api_key: AnyValue.string,
                                                  sort_by: AnyValue.string, page: AnyValue.int)
        self.mockModel.verify(verificationMode: Once()).getMovieList(router: router, completion: { _ in })
    }
    
    func testVerifyForRemoveRealmObjects(){
        
        movieViewModel.verifyForRemoveRealmObjects(forceRemove: true)
        self.mockModel.verify(verificationMode: Once()).removeRealmObjects()
    }
    
    func testGetShownMovie(){

        _ = movieViewModel.getShownMovie()
        self.mockModel.verify(verificationMode: Once()).getMovieObject()
    }
}
