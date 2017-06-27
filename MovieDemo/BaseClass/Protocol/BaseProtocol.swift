//
//  BaseProtocol.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

public protocol BaseViewModelDelegate: class {
    
    // Load data
    
    func onDataDidLoad()
    func onDataDidLoadErrorWithMessage(errorMessage:String)
    
    func testChangingName()
    
    // Loading
    func showLoading()
    func hideLoading()
}
