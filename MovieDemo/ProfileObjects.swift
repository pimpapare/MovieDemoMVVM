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
        
        avatar_url = dict["avatar_url"] as? String ?? "None"
        name = dict["name"] as? String ?? "None"
        company = dict["company"] as? String ?? "None"
        blog = dict["blog"] as? String ?? "None"
        
        let convertSringToDate = dict["created_at"] as? String ?? ""
        created_at = convertSringToDate.toDate().string
        
        email = dict["email"] as? String ?? "None"
        hireable = dict["hireable"] as? String ?? "None"
        
        //case error
        statusService = dict["success"] as? Bool
        statusMessage = dict["message"] as? String
    }
}
