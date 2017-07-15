//
//  UnwindableViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/14/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

extension String {
    
    public static let segueMovieTableView = "movieTableView"
    public static let segueMovieCollectionView = "movieCollectionView"
    
    //seque
    public static let unwindToTableViewWithSegue = "unwindToTableViewWithSegue"
}

extension MovieTableViewController {
    
    @IBAction func unwindToTableViewWithSegue(segue:UIStoryboardSegue) {
    }
}
