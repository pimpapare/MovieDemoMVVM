//
//  MovieModel.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation

class MovieModel: BaseModel {

    var movies:[[String:AnyObject]]?
    var movieName:[String] = [String]()
    
    var id : String!
    var itemName : String!
    var itemImage : String!
    
    var nextMovieIndex: Int? = 0
    var nextMovieAvailable: Bool?
    
    required init(withDictionary dict: [String:AnyObject]) {
        super.init(withDictionary: dict)
        self.movies = dict["results"] as? [[String : AnyObject]]        
//        self.nextMovieIndex = self.movies?.count
        self.nextMovieAvailable = true
        
        getMovieName()
    }
    
    func getMovieName(){
        
        for dic in movies! {
            movieName.append(dic["title"] as! String)
            self.itemName = dic["title"] as! String
            self.itemImage = dic["backdrop_path"] as! String
        }
        
        print("💜 ",movieName)
        
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
