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
import AlamofireImage

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
        
        populateLbls(withMovieID: "tt6644200") { (movie, err) in
            
            guard let movie = movie else{
                if let error = err {
                    print("Could not retrieve movie with error: \(String(describing: error))")
                }else{
                    print("Could not retrieve movie with an unkown error")
                }
                return
            }
            
            print(movie.name)
            print(movie.cast)
            print(movie.year.year)
            print(movie.plot)
            print(movie.imageURL)
            print(movie.rating)
            
            self.nameLbl.text = movie.name
            self.yearLbl.text = String(describing: movie.year.year)
            self.castLbl.text = movie.cast
            self.plotLbl.text = movie.plot
            
            self.getImage(withImageUrl: movie.imageURL, imageDownloadCompletion: { (posterImg, err) in
                
                guard let poster = posterImg else {
                    if let error = err {
                        print("Could not retrieve poster image with error: \(String(describing: error))")
                    }else{
                        print("Could not retrieve poster image with an unkown error")
                    }
                    return
                }
                
                self.posterImageView.image = poster
                
            })

        }
        
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
