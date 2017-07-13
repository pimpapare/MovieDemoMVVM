//
//  ProfileViewModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class ProfileViewModel {
    
    var viewInterfaceProtocol:ProfileViewControllerProtocol!
    var modelProtocol:ProfileModelProtocol!
    var model:ProfileModel = ProfileModel()
    
    let baseFunction:BaseFunction = BaseFunction()
    var page: Int! = 0
    
    required init(view:ProfileViewControllerProtocol, viewControllerModel:ProfileModelProtocol) {
        self.viewInterfaceProtocol = view
        self.modelProtocol = viewControllerModel
    }
    
    func getProfileService(name:String) {
        
        let router = AlamofireRouter.getProfile(name: name)
        self.modelProtocol.getProfile(router: router, completion: { (result, error) in
            
            if error != nil {
                self.viewInterfaceProtocol.onDataDidLoadErrorWithMessage(errorMessage: error!.localizedDescription)
            }else{                
                self.viewInterfaceProtocol.setProfile(userModel: result!)
            }
        })
    }
}
