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
    var imageURL: String?
    var name: String?
    var year: Date!
    var cast: String?
    var plot: String?
    var rating: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imageURL   <- map["Poster"]
        name       <- map["Title"]
        year       <- (map["Year"], yearTranform)
        cast       <- map["Actors"]
        plot       <- map["Plot"]
        rating     <- (map["Ratings.1.Value"], ratingTransform)
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
    
    let ratingTransform = TransformOf<Int, String>(fromJSON: { (ratingString: String?) -> Int? in
        if let rating = ratingString{
            return Int(ratingString!)
        }
        return nil
    }, toJSON: { (rating: Int?) -> String? in
        return String(describing: rating)
    })
    
}
