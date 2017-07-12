//
//  MovieCollectionViewCell.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    static let identifier = "PlaceCollectionViewCell"

    override func awakeFromNib() {
        imageCell.layer.cornerRadius = 5
    }
    
    func setCell(objects:SubscribePlace) {
        self.title.text = "\(objects.name)"
        self.imageCell.moa.url = objects.image
    }
}
