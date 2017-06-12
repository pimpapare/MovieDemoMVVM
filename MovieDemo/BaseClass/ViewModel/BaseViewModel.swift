//
//  BaseViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

public class BaseViewModel: NSObject {
    
    public weak var delegate: BaseViewModelDelegate?
    
    required public init(delegate: BaseViewModelDelegate) {
        self.delegate = delegate
    }
}
