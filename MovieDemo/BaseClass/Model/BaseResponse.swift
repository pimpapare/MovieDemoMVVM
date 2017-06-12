//
//  BaseResponse.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation


public class BaseModel: NSObject {
    var status: String?
    var message: String?
    public required init(withDictionary dict: [String:AnyObject]) {
        self.status = dict["status"] as? String
        self.message = dict["message"] as? String
    }
}

