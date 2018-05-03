//
//  GameViewController.swift
//  MovieMash
//
//  Created by Alex on 5/2/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftDate

class GameViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    @IBOutlet weak var movieNumberLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var ratingField: RatingTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
//        Alamofire.request("http://www.omdbapi.com/?apikey=3d0d5c72&i=tt1285016").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                let movie = Mapper<Movie>().map(JSONString: json as! String)
//                print(movie?.name)
//                print(movie?.cast)
//            }
//
//
//        }
//
        
        Alamofire.request("\(BASE_URL)tt1285016").validate().responseObject { (response: DataResponse<Movie>) in
            
            guard response.result.isSuccess else {
                print("An error occured retrieving movie with error: \(String(describing: response.error))")
                return
            }
    
            if let movie = response.result.value{
                print(movie.name)
                print(movie.cast)
                print(movie.year.year)
                print(movie.plot)
                print(movie.imageURL)
                print(movie.rating)
            }
            
            
            


        }
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension UIViewController{
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
