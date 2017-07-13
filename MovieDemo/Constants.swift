//
//  Constants.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class Constants {
    
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    
    static let keyboardHeight = 224
    static let keyboardHeightLandScape = 162
}

public extension String {

    public static let segueMovieTableView = "movieTableView"
    public static let segueMovieCollectionView = "movieCollectionView"
    
    //seque
    public static let unwindToTableViewWithSegue = "unwindToTableViewWithSegue"
    
    //profile
    public static let name = "Name: "
    public static let company = "Company: "
    public static let blog = "Blog: "
    public static let created_at = "Created_at: "
    public static let email = "Email: "
    public static let hireable = "Hireable: "
}
