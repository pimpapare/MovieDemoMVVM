//
//  HistorySectionController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import IGListKit

enum LoadingType: String {
    case refresh, loadmore
}

class MovieSectionController: ListSectionController {
    
    var object: MovieModel?
    
    override func numberOfItems() -> Int {
        return (object?.movies?.count) ?? 0
    }
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top:0, left: 0, bottom: 10, right: 0)
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width:UIScreen.main.bounds.width, height: 200)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext?.dequeueReusableCell(withNibName: MovieCollectionViewCell.identifier, bundle: nil, for: self, at: index) as! MovieCollectionViewCell
        cell.setCell(obejcts: object,index: index)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? MovieModel
    }
    
    override func didSelectItem(at index: Int) {
    }
}
