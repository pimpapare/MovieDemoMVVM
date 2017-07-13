//
//  ProfileModelTests.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import XCTest
import Mockit
import Hamcrest
import Alamofire

@testable import MovieDemo

class MockProfileInterfaceProtocol: ProfileViewControllerProtocol, Mock {

    var callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> ProfileViewControllerProtocol {
        return self
    }
    
    func onDataDidLoadErrorWithMessage(errorMessage: String){
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func setProfile(userModel:ProfileObjects){
        let _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}

class ProfileViewModelTests: XCTestCase {

    var mockModel: MockProfileModel! // model
    var profileViewModel: ProfileViewModel! // view model
    var mockProfileInterfaceProtocol: MockProfileInterfaceProtocol! // protocol

    override func setUp() {
        super.setUp()
        
        mockModel = MockProfileModel(testCase: self)
        mockProfileInterfaceProtocol = MockProfileInterfaceProtocol(testCase: self)
        profileViewModel = ProfileViewModel(view: mockProfileInterfaceProtocol, viewControllerModel: mockModel)
    }
    
    func testCallOnDataDidLoadErrorWithMessage() {
        
//        profileViewModel.getProfileService(name:"")
//        mockProfileInterfaceProtocol.verify(verificationMode: Once()).onDataDidLoadErrorWithMessage(errorMessage:AnyValue.string)
    }
}
