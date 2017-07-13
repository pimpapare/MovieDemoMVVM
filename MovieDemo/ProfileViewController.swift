

//
//  ProfileViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/12/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import moa
import AAShimmerView

protocol ProfileViewControllerProtocol {
    
    func onDataDidLoadErrorWithMessage(errorMessage: String)
    func setProfile(userModel:ProfileObjects)
}

class ProfileViewController: UIViewController,ProfileViewControllerProtocol {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var companyProfile: UILabel!
    @IBOutlet weak var blogProfile: UILabel!
    @IBOutlet weak var locationProfile: UILabel!
    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var hireableProfile: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    var profileViewModel:ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView(shimmering:true)
        setUpViewController()
    }
    
    func setUpView(shimmering:Bool) {
        
        containerView.aaShimmerSubViews = [ nameProfile, companyProfile, blogProfile, locationProfile, emailProfile, hireableProfile]
        
        if shimmering{
            containerView.startShimmering()
        }else{
            imageProfile.backgroundColor = UIColor.clear
            containerView.stopShimmering()
        }
    }
    
    func setUpViewController() {
        profileViewModel = ProfileViewModel(view: self, viewControllerModel: ProfileModel())
        profileViewModel.getProfileService(name:"Pimpapare")
    }
    
    func setProfile(userModel:ProfileObjects) {
        
        setUpLabelView(titleText: .name, text: userModel.name!, label: nameProfile)
        setUpLabelView(titleText: .company, text: userModel.company!, label: companyProfile)
        setUpLabelView(titleText: .blog, text: userModel.blog!, label: blogProfile)
        setUpLabelView(titleText: .created_at, text: userModel.created_at!, label: locationProfile)
        setUpLabelView(titleText: .email, text: userModel.email!, label: emailProfile)
        setUpLabelView(titleText: .hireable, text: userModel.hireable!, label: hireableProfile)
        
        imageProfile.moa.url = userModel.avatar_url
        
        setUpView(shimmering:false)
    }
    
    func setUpLabelView(titleText:String,text:String,label:UILabel) {
        
        let combindText = titleText + text
        var textString = NSMutableAttributedString()
        
        textString = NSMutableAttributedString(string: combindText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17, weight:UIFontWeightRegular)])
        textString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: NSRange(location:titleText.characters.count,length:text.characters.count)) // Text
        textString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold), range: NSRange(location: 0,length: titleText.characters.count)) // Title
        
        label.attributedText = textString
    }
    
    func onDataDidLoadErrorWithMessage(errorMessage: String) {
        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
    }
}
