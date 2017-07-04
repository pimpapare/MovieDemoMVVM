

//
//  LauchViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class LauchViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.perform(#selector(goToMovieTableView), with: nil, afterDelay: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goToMovieTableView() {
        self.performSegue(withIdentifier: .segueMovieTableView, sender: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
