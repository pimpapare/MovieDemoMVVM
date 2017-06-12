//
//  MovieCollectionViewCell.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import moa

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txTitle: UILabel!

    override func awakeFromNib() {
        self.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
    }
    
    func setCell(obejcts:MovieModel?,index:Int){
        
        self.txTitle.text = obejcts?.getMovieValue(at: index, key: "title")
        self.image.moa.url = String(format:"http://image.tmdb.org/t/p/w185/%@",obejcts?.getMovieValue(at: index, key: "backdrop_path") ?? " ")
    }
}
