//
//  AlamofireService.swift
//  MovieMash
//
//  Created by Alex on 5/3/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftDate
import AlamofireImage

class AlamofireService {
    fileprivate static let _instance = AlamofireService()
    
    static var instance: AlamofireService {
        return _instance
    }
    
    func populateLbls(withMovieID id: String, movieDownloadCompletion: @escaping (_ movie: Movie?, _ error: Error?) -> ()) {
        Alamofire.request("\(BASE_URL)\(id)").validate().responseObject { (response: DataResponse<Movie>) in
            
            guard response.result.isSuccess else {
                movieDownloadCompletion(nil, response.error)
                return
            }
            
            guard let movie = response.result.value else {
                movieDownloadCompletion(nil, nil)
                return
            }
            
            movieDownloadCompletion(movie, nil)
            
        }
    }
    
    func getImage(withImageUrl url: String, imageDownloadCompletion: @escaping (_ poster: Image?, _ error: Error?) -> ()){
        Alamofire.request(url).responseImage { response in
            
            guard response.result.isSuccess else {
                imageDownloadCompletion(nil, response.error)
                return
            }
            
            guard let image = response.result.value else {
                imageDownloadCompletion(nil, nil)
                return
            }
            
            imageDownloadCompletion(image, nil)
            
        }
        
    }
    
}
