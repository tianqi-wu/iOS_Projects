//
//  Path.swift
//  AndyWu_Lab3
//
//  Created by Tianqi Wu on 2019/9/25.
//  Copyright © 2019 Tianqi Wu. All rights reserved.
//

import Foundation
import UIKit

struct Path{
    
    
    
    //Reasons why I am defining these functions and variables:
    //RealPoint is a collection of all points involved in a single path.
    //However, this path might be altered by other paths. My ideas are that to set
    //ALl relevant retails to private, so that no further unintended modification may occur
    //.
    
    var realPoint: [CGPoint]
    var realPath: UIBezierPath
    var radius: CGFloat
    var Color: UIColor
}
