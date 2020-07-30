//
//  graphView.swift
//  AndyWu_Lab3
//
//  Created by Tianqi Wu on 2019/9/25.
//  Copyright © 2019 Tianqi Wu. All rights reserved.
//

import UIKit

class graphView: UIView {

    //If the color is strange with black background, we may want to initialize a better way.
    
    private var radius: CGFloat = 12
    private var Color: UIColor = UIColor.black
    //Records all the undo things happened.
    var undoRecord: [Bool] = []
    
    var thePath:Path? {
        didSet {
            setNeedsDisplay()
        }
    }
    var Paths:[Path] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    
    //below from https://stackoverflow.com/questions/38966565/fatal-error-initcoder-has-not-been-implemented-error-despite-being-implement
    //Thanks for the intuition from a TA.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //End -> initialization
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        // implemented
        return CGPoint(x: (first.x+second.x)/2, y: (first.y+second.y)/2)
        
    }
    //For changing the radius of what we want to add.
    func changeRadius(radius: CGFloat){
        self.radius = radius
    }
    
    //For changing the color of what we wish to add.
    func changeColor(Color: UIColor){
        self.Color = Color
    }
    //End of mutators.
    
    //Create a smooth path that's gonna work.
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object

        if(points.count <= 1){ //There are no points to add to this path
            return path
            
        }
        
    else{
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second:
                points[i])
            //Get midpoint between the path's last point and the next one in
            //the array
            let secondMidpoint = midpoint(first: points[i], second:
                points[i+1])
            //Get midpoint between the next point in the array and the one
            //after it
            
            //Some minor tweaks thanks for the piazza post.
            if((path.currentPoint.x == points[i].x && points[i].x == points[i+1].x && ((path.currentPoint.y < points[i].y && points[i].y > points[i+1].y)||(path.currentPoint.y > points[i].y && points[i].y < points[i+1].y) ))||((path.currentPoint.y == points[i].y && points[i].y == points[i+1].y && ((path.currentPoint.x < points[i].x && points[i].x > points[i+1].x)||(path.currentPoint.x > points[i].x && points[i].x < points[i+1].x) )) )){
                let newNewPath = UIBezierPath()
                newNewPath.addArc(withCenter: points[i], radius: radius/32.0, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
                Color.setFill()
             newNewPath.fill()
             path.append(newNewPath)
            }
            
             
 
            
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
                          controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
            //path.addClip()
            
            path.lineWidth = radius
            path.lineJoinStyle = .round
            path.lineCapStyle = .round
        }
        return path
        }
    }
    
    private func drawPoint(_ path: Path){
        let color1 = path.Color
        let radius1 = path.radius
        let path1 = UIBezierPath()
        path1.addArc(withCenter: path.realPoint[0], radius: radius1/2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        color1.setFill()
        path1.fill()
    }
 
 
        //Default color: black.
    private func drawPath(_ path: Path){
        
 
        let color1 = path.Color
        let radius1 = path.radius
        let path1 = createQuadPath(points: path.realPoint)
        path1.lineWidth = radius1
        path1.lineJoinStyle = .round
        path1.lineCapStyle = .round
        color1.setStroke()
        path1.stroke()
        
        

    }
            //Default color: black. Specially designed for newer versions of lines.
    private func drawPath1(_ path: Path){

        let color1 = path.Color
        let radius1 = path.radius
        let path1 = createQuadPath(points: path.realPoint)
        path1.lineWidth = radius1
        path1.lineJoinStyle = .round
        path1.lineCapStyle = .round
        color1.setStroke()
        path1.stroke()
        
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        // Drawing code
        //There's a song called living path ~ Circuit.
        
        for Path in Paths {
            if(Path.realPoint.count>1){
                drawPath(Path)
            }else if(Path.realPoint.count == 1){
                drawPoint(Path)
            }
        }
    
        
        if let myRealPath = thePath  {
            if(myRealPath.realPoint.count>1){
                drawPath1(myRealPath)
                
            
        }else if(myRealPath.realPoint.count == 1){
            drawPoint(myRealPath)
        }
        
        
        }
    }
    

    
}
