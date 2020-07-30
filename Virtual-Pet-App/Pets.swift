//
//  Pets.swift
//  AndyWu-Lab2
//
//  Created by Tianqi Wu on 2019/9/14.
//  Copyright © 2019 Tianqi Wu. All rights reserved.
//

/* Andy's debugging dashtable
 Claim: Code represents my own work, with minor reference from the Prof.
 
 */

import Foundation
//MVC: M part
class Pets{
    
        
        enum petType{
            case dog
            case cat
            case bird
            case bunny
            case fish
            case null
        }
        
        //Data
        
        //Might have to change this to private (set).
        var petSpecie: petType
        private (set) var happiness:Int
        private (set) var foodLevel:Int
        private (set) var feedTimes:Int
        private (set) var playTimes:Int
        var name:String?//Might be useful for the creative portion.
        //Behavior
        
        /*//////
         1. Check if food level is above 10
         2. If it is below 10:
         1. Increment food level variable and update displayView to match
         2. Increment number of times fed variable and update label to match
        */
        
        
        
        
        func feed()->Int {
            if(foodLevel<10){
                foodLevel += 1
                feedTimes += 1
            //updateLabel and Number
                return 0
            }
            return -1
        }
        /*////
         1. Check if the food level is above 1
         2. If it is above 1:
         1. Increment happiness variable and update displayView to match
         2. Increment number of times played with variable and update label to match
         3. Decrement food level variable and update displayView to match
         Debugging dashtable: Not sure how much we should increase.
         */
        
            
            
            
            
        func play()->Int {
            if(foodLevel>1){
                happiness = happiness + 1;
                //Update display value
                foodLevel -= 1
                playTimes += 1
                //Update display value
                return 0
            }
            
            return -1
            
        }
        
        //Init
    init(petSpecies: petType, feedTimes: Int, playTimes: Int, name:String, currHappiness: Int, currFoodLevel: Int){
        self.feedTimes = feedTimes
        self.playTimes = playTimes
        self.petSpecie = petSpecies
            //You don't want to mess up
                self.name = "Petty" //Default name
                self.happiness = currHappiness
                self.foodLevel = currFoodLevel
            }
    
    
    
}
