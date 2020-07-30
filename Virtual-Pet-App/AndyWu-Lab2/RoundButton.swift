//
//  RoundButton.swift
//  InClassDemo1
//
//  Created by Tianqi Wu on 2019/9/27.
//  Copyright © 2019 Todd Sproull. All rights reserved.
//

//This code has a reference to https://medium.com/@filswino/easiest-implementation-of-rounded-buttons-in-xcode-6627efe39f84.
//I am using this as a framework. (or a library, to be specific.)

import Foundation
import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
//End of reference.
