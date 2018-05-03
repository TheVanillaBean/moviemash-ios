//
//  RatingTextField.swift
//  MovieMash
//
//  Created by Alex on 5/2/18.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

@IBDesignable
class RatingTextField: UITextField {

    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    let padding = UIEdgeInsets(top: 8, left: 5, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setupView(){
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.5529411765, blue: 1, alpha: 1)
        self.layer.borderWidth = 2
    }
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }

}
