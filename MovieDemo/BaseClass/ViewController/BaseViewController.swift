//
//  BaseViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

extension UIViewController{

    func showAlertPopup(title: String, message: String, yes_text: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: yes_text, style: .default, handler:nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController: BaseViewModelDelegate {
    
    public func testChangingName(){
        
    }

    public func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    public func onDataDidLoad() {
        
    }
    
    public func onDataDidLoadErrorWithMessage(errorMessage: String) {
        
    }
}
