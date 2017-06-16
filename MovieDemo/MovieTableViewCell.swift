//
//  MovieTableViewCell.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/15/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import moa

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
    }

    func setCell(objects:[String:AnyObject]) {
        titleCell.text = objects["title"] as? String
        self.imageCell.moa.url = String(format:"http://image.tmdb.org/t/p/w185/%@",objects["backdrop_path"] as? String ?? "")
    }
}