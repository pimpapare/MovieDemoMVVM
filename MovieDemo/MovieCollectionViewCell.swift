//
//  MovieCollectionViewCell.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    static let identifier = "MovieCollectionViewCell"

    override func awakeFromNib() {
        imageCell.layer.cornerRadius = 5
    }
    
    func setCell(objects:Subscribe) {
        self.imageCell.moa.url = String(format:"http://image.tmdb.org/t/p/w185/%@",objects.image)
    }
}
