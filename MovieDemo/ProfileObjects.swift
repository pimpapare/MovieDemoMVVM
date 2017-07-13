//
//  ProfileObjects.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class ProfileObjects: BaseModel {

    var avatar_url: String?
    var name: String?
    var company: String?
    var blog: String?
    var created_at: String?
    var email: String?
    var hireable: String?

    var statusService:Bool?
    var statusMessage:String?
    
    required init(withDictionary dict: [String:AnyObject]) {
        super.init(withDictionary: dict)
        
        avatar_url = dict["avatar_url"] as? String ?? " "
        name = dict["name"] as? String ?? " "
        company = dict["company"] as? String ?? " "
        blog = dict["blog"] as? String ?? " "
        created_at = dict["created_at"] as? String ?? " "
        email = dict["email"] as? String ?? " "
        hireable = dict["hireable"] as? String ?? " "
        
        //case error
        statusService = dict["success"] as? Bool
        statusMessage = dict["message"] as? String
    }
}
