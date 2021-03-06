//
//  MovieModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import IGListKit

class MovieModel: BaseModel {

    var movies:[[String:AnyObject]]?
    
    var nextMovieIndex: Int? = 0
    var nextMovieAvailable: Bool?
    
    required init(withDictionary dict: [String:AnyObject]) {
        super.init(withDictionary: dict)
        self.movies = dict["results"] as? [[String : AnyObject]]        
//        self.nextMovieIndex = self.movies?.count
        self.nextMovieAvailable = true
    }
    
    func getMovieValue(at index:Int, key:String) -> String{
        let getName = MovieValue.init(movies: movies)
        return getName[index,key] as? String ?? " "
    }
}

struct MovieValue {
    
    var movies:[[String:AnyObject]]?    
    subscript (_ index:Int,_ key:String) -> AnyObject?{
        return movies?[index][key]
    }
}

extension MovieModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
