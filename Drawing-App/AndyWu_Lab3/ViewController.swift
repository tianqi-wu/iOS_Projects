//
//  ViewController.swift
//  AndyWu_Lab3
//
//  Created by Tianqi Wu on 2019/9/25.
//  Copyright © 2019 Tianqi Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate{

    //Global variable initialization
    
 
    @IBOutlet weak var outletUpper: UINavigationItem!
    @IBOutlet weak var clear: UIBarButtonItem!
    @IBOutlet weak var tweak: UISlider!
    @IBOutlet weak var undoer: UIBarButtonItem!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var currentColor: UIView!
    
    
    
    
    
    //Relevant definitions on the circles
    var currentCircleCenter = CGPoint.zero
    var currentPathCenter = CGPoint.zero
    var currentPath: Path?
    var theLostCanvas:graphView!
    //Creative Portion
    var watermark = " "
    //A test. A tweak.
    
    
    
    var currentPathPoints = [CGPoint]()
    
    var  currentPathWidth : CGFloat = 12.00

    
    //Sth related to colors
    var color = UIColor.black//Default color
   
    //clear all the entries.
    
    @IBAction func clearAll(_ sender: Any) {
        theLostCanvas.thePath = nil
        theLostCanvas.Paths = []
    }
    
    //undo the current entry.
    
    @IBAction func undo(_ sender: Any) {
       theLostCanvas.thePath = nil
        if(!theLostCanvas.Paths.isEmpty){
        theLostCanvas.Paths.removeLast()
        }
        
        
    }
    
    //Setting up all the colors.
    
    @IBAction func changeToRed(_ sender: Any) {
color = UIColor.red
    theLostCanvas.changeColor(Color: UIColor.red)
        currentColor.backgroundColor = UIColor.red
    }
    
    @IBAction func changeOrange(_ sender: Any) {
        color = UIColor.orange
        theLostCanvas.changeColor(Color: UIColor.orange)
        currentColor.backgroundColor = UIColor.orange
    }
    
    @IBAction func changeYellow(_ sender: Any) {
       color = UIColor.yellow
        theLostCanvas.changeColor(Color: UIColor.yellow)
        currentColor.backgroundColor = UIColor.yellow
    }
    
    @IBAction func changeGreen(_ sender: Any) {
        color = UIColor.green
        theLostCanvas.changeColor(Color: UIColor.green)
        currentColor.backgroundColor = UIColor.green
    }
    
    @IBAction func changeBlue(_ sender: Any) {
        color = UIColor.blue
        theLostCanvas.changeColor(Color: UIColor.blue)
        currentColor.backgroundColor = UIColor.blue
    }
    
    @IBAction func changePurple(_ sender: Any) {
        color = UIColor.purple
        theLostCanvas.changeColor(Color: UIColor.purple)
        currentColor.backgroundColor = UIColor.purple
    }
    
    @IBAction func changeBlack(_ sender: Any) {
        color = UIColor.black
        theLostCanvas.changeColor(Color: UIColor.black)
        currentColor.backgroundColor = UIColor.black
    }
    
    @IBAction func changeWhite(_ sender: Any) {
        color = UIColor.white
        theLostCanvas.changeColor(Color: UIColor.white)
        currentColor.backgroundColor = UIColor.white
    }

    
    
    //End of color setting-up. I cannot find anything associated with radio buttons, sorry.
    
    @IBAction func sizeTweak(_ sender: Any) {
        currentPathWidth = CGFloat(tweak.value)
        theLostCanvas.changeRadius(radius:CGFloat(tweak.value))
    }
    
    //Creative Portion.

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //828*743 should be its screen size. Here I code its actual size so the creative portion pictures would look reasonable.
        let rect = CGRect(x: 0, y: 0, width: 418, height: 743)
        theLostCanvas = graphView(frame: rect)
        view.addSubview(theLostCanvas)
        // Do any additional setup after loading the view.

        
 
    }
    
    
    
    
    /* Creative Portion
     //Claim: All codes submitted are properly referenced.
     
     
     
     
     
     */
    
/* Creative Portion 1-1:
Save the graphView from theLostCanvas as a picture.
 References:(With some minor tweaks that can be shown in my code)
 
 https://stackoverflow.com/questions/40188126/how-to-save-screenshot-of-a-view-with-its-subviews-in-swift
 major implementations
 
 https://stackoverflow.com/questions/46601885/nsphotolibraryaddusagedescription-error
 for the xml file
 */
    
    func screenShotMethod() {
        //For creative portion II , I add these things. The CGRect is arbitarily set up.
        let watermarkRally = UILabel(frame: CGRect(x: 262, y: 598, width: 200, height: 100))
        
        watermarkRally.text = watermark
        watermarkRally.alpha = 0.78
        watermarkRally.font = watermarkRally.font.withSize(36)
        
        watermarkRally.adjustsFontSizeToFitWidth = true
        //Add a subview and then remove it so that no future problems would occur.
        theLostCanvas.addSubview(watermarkRally)
        //The real part of Creative Portion I.
        UIGraphicsBeginImageContext(theLostCanvas.frame.size)
        if let realImage = UIGraphicsGetCurrentContext(){
        theLostCanvas.layer.render(in: realImage)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let newOmegaImage = image{
        UIImageWriteToSavedPhotosAlbum(newOmegaImage, nil, nil, nil)
        }
        //Stack-like structure works here. This is an example.
        //watermarkRally1.removeFromSuperview()
        watermarkRally.removeFromSuperview()
    }
    
    
    
    //Download the content as a picture. Reference is shown with the Creative Portion I.
    @IBAction func downloadAsPicture(_ sender: Any) {
        screenShotMethod()

        //add Alert underneath.
        let alert = UIAlertController(title: "Picture Downloaded",
                                      message: "Your virtual painting has been downloaded.",
                                      preferredStyle: .alert)
        let good = UIAlertAction(title: "Good.", style: .default, handler: { (action) -> Void in })
        alert.addAction(good)
        present(alert, animated: true, completion: nil)
        
    }
    //End of Creative 1-1.

    
    //Some trivial function here.
    @IBAction func contactAndy(_ sender: Any) {
        let alert = UIAlertController(title: "Info About the Developer",
                                      message: "Made by Andy Wu @ McKelvey Engineering. All rights reserved. Creative Portion: Downloader and Watermark Adder",
                                      preferredStyle: .alert)
        let good = UIAlertAction(title: "I understand...", style: .default, handler: { (action) -> Void in })
        alert.addAction(good)
        present(alert, animated: true, completion: nil)
    }
    //End of my own function.
    
    //Creative Portion 2:
    //add watermarks on pictures. They are sizeable, and works properly.
    //References:
   //https://developer.apple.com/documentation/uikit/uialertcontroller //https://code.tutsplus.com/tutorials/create-a-custom-alert-controller-in-ios-10-swift-3--cms-27589
    //https://stackoverflow.com/questions/35257883/taking-a-screenshot-and-adding-a-text-watermark-on-top-in-swift
    //
    
    @IBAction func addWater(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add your watermark",
                                      message: "Add your watermark for copyright. You current watermark is: \(watermark), trimmed in first 5 letters",
                                      preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            if let newTextField = alert.textFields{
            let textField = newTextField[0]
                //Assign a value to watermark.
                self.watermark = textField.text ?? " "
                if(self.watermark.count > 5){
                    self.watermark = String(self.watermark.prefix(5))
                }
            }
        })
        // Cancel button
        let cancel = UIAlertAction(title: "Exit", style: .destructive, handler: { (action) -> Void in })
        alert.addTextField { (textField: UITextField) in
            textField.autocorrectionType = .default
            textField.placeholder = "Type your Nickname here"
        }
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    //End of creative portion 2.
    
    
    
    //Specify where a certain path/graph started.
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentPathCenter = touchPoint

        currentPath = Path(realPoint:[] ,realPath:UIBezierPath(arcCenter: currentPathCenter, radius: currentPathWidth, startAngle: 0.0, endAngle: 0.0, clockwise: true), radius: currentPathWidth, Color: color)
        
        currentPath?.realPoint.append(touchPoint)
        
        
    }
//Specify where a point moves. Pretty good for lines.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentPath?.realPoint.append(touchPoint)
        theLostCanvas.thePath = currentPath
        
    }
    //Specify where a point ends.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let newPath = currentPath {
            theLostCanvas.Paths.append(newPath)
        }
        
    }
}

