//
//  MovieDemoTests.swift
//  MovieDemoTests
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import XCTest
import Mockingjay

@testable import MovieDemo

class MovieDemoTests: XCTestCase {
    
    var moviewViewModel:MovieViewModel!
    var movieViewController:MovieViewController!
    
    override func setUp() {
        super.setUp()
        
        movieViewController = MovieViewController()
        moviewViewModel = MovieViewModel(delegate: movieViewController)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTopCollectionViewInLandscapeRight() {
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        let result = moviewViewModel.sizeForTopOfCollectionView()
        XCTAssertEqual(result, 0)
    }
    
    func testTopCollectionViewInLandscapeLeft() {
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let result = moviewViewModel.sizeForTopOfCollectionView()
        XCTAssertEqual(result, 0)
    }
    
    func testTopCollectionViewInPortrait() {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let result = moviewViewModel.sizeForTopOfCollectionView()
        XCTAssertEqual(result, 20)
    }
    
    func testTopCollectionViewInPortraitUpsideDown() {
        
        let value = UIInterfaceOrientation.portraitUpsideDown.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let result = moviewViewModel.sizeForTopOfCollectionView()
        XCTAssertEqual(result, 20)
    }
}
