//
//  Movie.swift
//  MovieMash
//
//  Created by Alex on 5/2/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftDate

class Movie: Mappable {
    var _imageURL: String?
    var _name: String?
    var _year: Date!
    var _cast: String?
    var _plot: String?
    var _rating: String?
    
    var imageURL: String {
        return _imageURL ?? ""
    }
    
    var name: String {
        return _name ?? ""
    }
    
    var year: Date {
        return _year ?? Date()
    }
    
    var cast: String {
        return _cast ?? ""
    }
    
    var plot: String {
        return _plot ?? ""
    }
    
    var rating: String {
        return _rating ?? ""
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _imageURL   <- map["Poster"]
        _name       <- map["Title"]
        _year       <- (map["Year"], yearTranform)
        _cast       <- map["Actors"]
        _plot       <- map["Plot"]
        _rating     <- (map["Ratings.1.Value"])
    }
    
    //transforms
    let yearTranform = TransformOf<Date, String>(fromJSON: { (dateString: String?) -> Date? in
        
        if let date = dateString, let swiftDate = date.date(format: .custom("yyyy"))?.absoluteDate {
            return swiftDate
        }
        
        return Date()

    }, toJSON: { (dateObj: Date?) -> String? in
        if let date = dateObj {
            return String(date.year)
        }
        return nil
    })
    
//    let ratingTransform = TransformOf<Int, String>(fromJSON: { (ratingString: String?) -> Int? in
//        if let rating = ratingString{
//            return Int(ratingString!)
//        }
//        return nil
//    }, toJSON: { (rating: Int?) -> String? in
//        return String(describing: rating)
//    })
    
}
