//
//  ProfileModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

protocol ProfileModelProtocol {
    
    func getProfile(router:AlamofireRouter, completion: @escaping (_ result: ProfileObjects?, _ error: Error?) -> Void)
}

class ProfileModel:ProfileModelProtocol {
    
    func getProfile(router:AlamofireRouter, completion: @escaping (_ result: ProfileObjects?, _ error: Error?) -> Void){
        
        _ = APIRequest.request(withRouter: router, withHandler: { [weak self] (response, error) in
            
            if let response = response as? ProfileObjects {
                
                guard response.name != nil else{
                    let errorTemp = NSError(domain: "Error" , code: 404, userInfo: nil)
                    completion(nil, errorTemp)
                    return
                }
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        })
    }
}
