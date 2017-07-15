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

func timeFormat() -> String {
    return "HH:mm:ss"
}

func dateFormate() -> String {
    return "dd-mm-yyyy"
}

extension Date {
    var string:String {
        let dateFormat = DateFormatter()
//        dateFormat.dateFormat = "yyyy-MM-dd*\(timeFormat()).000000"
        dateFormat.dateFormat = "yyyy-MM-dd \(timeFormat())"
        dateFormat.calendar = Calendar(identifier: .gregorian)
        dateFormat.timeZone = TimeZone(secondsFromGMT: 0)
//        return dateFormat.string(from: self).replacingOccurrences(of: "*", with: "T")
        return dateFormat.string(from: self)
    }
}

public extension String {
    
    var date:Date? {
        let dateString = self.components(separatedBy: ".")[0].components(separatedBy: "T").joined(separator: " ").appending(" +0000")
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        dateFormat.calendar = Calendar(identifier: .gregorian)
        return dateFormat.date(from: dateString)
    }
    
    var countryName : String? {
        return (Locale.current as NSLocale).displayName(forKey: .countryCode, value: self)
    }
    
    static var countryName : String? {
        return Locale.current.regionCode?.countryName
    }
    
    func  toDate() -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self){
            return date
        }
        print("Invalid arguments ! Returning Current Date . ")
        return Date()
    }
    
    //profile
    public static let name = "Name: "
    public static let company = "Company: "
    public static let blog = "Blog: "
    public static let created_at = "Created_at: "
    public static let email = "Email: "
    public static let hireable = "Hireable: "
}
