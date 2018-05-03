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
        hideKeyboard()
        
        AlamofireService.instance.populateLbls(withMovieID: "tt6644200") { (movie, err) in
            
            guard let movie = movie else{
                if let error = err {
                    print("Could not retrieve movie with error: \(String(describing: error))")
                }else{
                    print("Could not retrieve movie with an unkown error")
                }
                return
            }
            
            self.nameLbl.text = movie.name
            self.yearLbl.text = String(describing: movie.year.year)
            self.castLbl.text = movie.cast
            self.plotLbl.text = movie.plot
            
            AlamofireService.instance.getImage(withImageUrl: movie.imageURL, imageDownloadCompletion: { (posterImg, err) in
                
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
    

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

