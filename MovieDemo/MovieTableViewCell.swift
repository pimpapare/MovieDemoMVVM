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
    
    static let identifier = "MovieTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x:0,y:0,width:Constants.deviceWidth,height:Constants.deviceHeight)
    }

    func setCell(objects:SubscribeMovie) {
            
        titleCell.text = objects.name
        self.imageCell.moa.url = String(format:"http://image.tmdb.org/t/p/w185/%@",objects.image)
    }
}
