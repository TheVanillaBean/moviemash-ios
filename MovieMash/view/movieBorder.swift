//
//  movieBorder.swift
//  MovieMash
//
//  Created by Alex on 5/2/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

@IBDesignable
class movieBorder: UIView {

    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }

}
