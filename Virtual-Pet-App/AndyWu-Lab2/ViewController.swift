//
//  ViewController.swift
//  AndyWu-Lab2
//
//  Created by Tianqi Wu on 2019/9/13.
//  Copyright © 2019 Tianqi Wu. All rights reserved.
//


/* Here starts the note from the Prof.
    I keep this note to refer to if I have the chance.
    Left, right, 
 
 */

import UIKit

//Creative Portion Only
//Citiation: https://codewithchris.com/avaudioplayer-tutorial/
//I hereby claim that all code relevant to the creative portion are my own work, with minor references to the website.
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var backGroundColor: UIView!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var happinessDisplay: UILabel!
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodDisplay: UILabel!
    @IBOutlet weak var foodBar: DisplayView!
    @IBOutlet weak var switchDog: UIButton!
    @IBOutlet weak var switchCat: UIButton!
    @IBOutlet weak var switchBird: UIButton!
    @IBOutlet weak var switchBunny: UIButton!
    @IBOutlet weak var switchFish: UIButton!
    //Value defined.
 
    var audioPlayer = AVAudioPlayer()
    

    //This is NOT an optional.
    private var currentPet: Pets! {
        didSet {
            updateView()
        }
    }
    
    var species = "dog" //Default value subject for change.
    
    //Updates the current view.
    func updateView(){
        /* Happinessss and fooood.
         */
        happinessDisplay.text = "played: " + String(currentPet.playTimes)
        let  happinessPercentageHelper = Double(currentPet.happiness)/10
        happinessBar.animateValue(to: CGFloat(happinessPercentageHelper))
        foodDisplay.text = "fed:" + String(currentPet.feedTimes)
        petImage.image = UIImage(named: species + ".png")
        let  foodaPercentageHelper = Double(currentPet.foodLevel)/10
        foodBar.animateValue(to: CGFloat(foodaPercentageHelper))
    }
    
    
    func makeCuteSound(){
        //Creative Portion: Adding sounds to the pets.
        //Have reference to
        //define and import the sound https://codewithchris.com/avaudioplayer-tutorial/
        //All portions of the creative portion are my own work. There are some minor references with understanding the material.
        if(species=="dog"){
            let dogBarks = Bundle.main.path(forResource: "dogBarks", ofType: "mp3")
            //Safe coding
            do{
                if let dogSound = dogBarks {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dogSound))
                } else {
                    //Nothing happens.
                }
            }catch{
                print("Error!")
            }
            audioPlayer.play()
        }//For cats
        else if(species=="cat"){
            let catEating = Bundle.main.path(forResource: "catEating", ofType: "mp3")
            //Safe coding
            do{
                if let catSound = catEating {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: catSound))
                } else {
                    //Nothing happens.
                }
            }catch{
                print("Error!")
            }
            audioPlayer.play()
        }
        else if(species=="bird"){
            let birdTweets = Bundle.main.path(forResource: "birdTweets", ofType: "mp3")
            //Safe coding
            do{
                if let birdSound = birdTweets {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: birdSound))
                } else {
                    //Nothing happens.
                }
            }catch{
                print("Error!")
            }
            audioPlayer.play()
        }
        else if(species=="bunny"){
            let rabbitSqueak = Bundle.main.path(forResource: "rabbitSqueak", ofType: "mp3")
            //Safe coding
            do{
                if let rabbitSound = rabbitSqueak {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: rabbitSound))
                } else {
                    //Nothing happens.
                }
            }catch{
                print("Error!")
            }
            audioPlayer.play()
        }else{
            let dolphinSound = Bundle.main.path(forResource: "dolphinSound", ofType: "mp3")
            //Safe coding
            do{
                if let whaleSound = dolphinSound {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: whaleSound))
                }
            }catch{
                print("Error!")
            }
            audioPlayer.play()
        }
        
    }
    
    
    @IBAction func updatePlayValue(_ sender: Any) {
        
        if(currentPet.play()==0){
            makeCuteSound()
        }
        updateView()
    }
    
    
    
    
    @IBAction func updateFeedValue(_ sender: Any) {
        if(currentPet.feed()==0){
            makeCuteSound()
        }
        updateView()
    }
    //Initialize all values.
    var dog = Pets(petSpecies: .dog, feedTimes: 0, playTimes:0, name: "dog", currHappiness: 0, currFoodLevel:0)

    
    var cat = Pets(petSpecies: .cat, feedTimes: 0, playTimes:0, name: "cat", currHappiness: 0, currFoodLevel:0)
    var bird = Pets(petSpecies: .cat, feedTimes: 0, playTimes:0, name: "bird", currHappiness: 0, currFoodLevel:0)
    var bunny = Pets(petSpecies: .bunny, feedTimes: 0, playTimes:0, name: "bunny", currHappiness: 0, currFoodLevel:0)
    var fish = Pets(petSpecies: .fish, feedTimes: 0, playTimes:0, name: "fish", currHappiness: 0, currFoodLevel:0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backGroundColor.backgroundColor = UIColor(red:1.00, green:0.14, blue:0.22, alpha:1.0)
        foodBar.color = UIColor(red:1.00, green:0.14, blue:0.22, alpha:1.0)
        happinessBar.color = UIColor(red:1.00, green:0.14, blue:0.22, alpha:1.0)
            currentPet = dog//Initialization
        petImage?.image = UIImage(named: "dog.png")
        let dogBarks = Bundle.main.path(forResource: "dogBarks", ofType: "mp3")
        //Safe coding
        do{
            if let dogSound = dogBarks {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dogSound))
            } else {
            //Nothing here.
            }
        }catch{
            print("Error!")
        }
        audioPlayer.play()
        
        

        
    }
    //
    

    
    
    @IBAction func dogUpdater(_ sender: Any) {
        if(species != "dog"){
            petImage.image = UIImage(named: "dog.png")
            backGroundColor.backgroundColor = UIColor(red:0.97, green:0.20, blue:0.22, alpha:1.0)
            foodBar.color = UIColor(red:0.97, green:0.14, blue:0.22, alpha:1.0)
            species = "dog"
            happinessBar.color = UIColor(red:0.97, green:0.14, blue:0.22, alpha:1.0)
            currentPet = dog
            updateView()
            makeCuteSound()
        }
    }
    
    //catUpdater!!!!!!!!!!
    
    @IBAction func catUpdater(_ sender: Any) {
        if(species != "cat"){
            species = "cat"
            petImage.image = UIImage(named: "cat.png")
            backGroundColor.backgroundColor = UIColor(red:0.27, green:0.51, blue:0.97, alpha:1.0)
            foodBar.color = UIColor(red:0.27, green:0.51, blue:0.97, alpha:1.0)
            happinessBar.color = UIColor(red:0.27, green:0.51, blue:0.97, alpha:1.0)
            currentPet = cat
            updateView()
            makeCuteSound()
        }
    }
    
    @IBAction func birdUpdater(_ sender: Any) {
        if(species != "bird"){
            species = "bird"
            petImage.image = UIImage(named: "bird.png")
            backGroundColor.backgroundColor = UIColor(red:0.98, green:0.93, blue:0.24, alpha:1.0)
            foodBar.color = UIColor(red:0.98, green:0.93, blue:0.24, alpha:1.0)
            happinessBar.color = UIColor(red:0.98, green:0.93, blue:0.24, alpha:1.0)
            currentPet = bird
            updateView()
                    makeCuteSound()
        
        
        }
    }
    
    @IBAction func fishUpdater(_ sender: Any) {
        if(species != "fish"){
            species = "fish"
            petImage.image = UIImage(named: "fish.png")
            backGroundColor.backgroundColor = UIColor(red:0.95, green:0.23, blue:1.00, alpha:1.0)
            foodBar.color = UIColor(red:0.95, green:0.23, blue:1.00, alpha:1.0)
            happinessBar.color = UIColor(red:0.95, green:0.23, blue:1.00, alpha:1.0)
            currentPet = fish
            updateView()
            
            makeCuteSound()
        
        
        }
    }
    
    @IBAction func bunnyUpdater(_ sender: Any) {
        if(species != "bunny"){
            species = "bunny"
            petImage.image = UIImage(named: "bunny.png")
            backGroundColor.backgroundColor = UIColor(red:0.42, green:0.77, blue:0.58, alpha:1.0)
            foodBar.color = UIColor(red:0.42, green:0.77, blue:0.58, alpha:1.0)
            happinessBar.color = UIColor(red:0.42, green:0.77, blue:0.58, alpha:1.0)
            currentPet = bunny
            updateView()
            

            
            makeCuteSound()
        }
    }
    
    

}

