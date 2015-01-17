//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Christian Köhler on 03.01.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import Foundation

class LionCub: Lion  {
    func rubLionsBelly () {
        println("LionCub: Snuggle and be happy ")
    }
    
    //could be used to override a function which is defined within the superclass "Lion" and to ive it a new functionality
    override func roar() {
        
        //The "super" Keyword gives access to the function in the super-class and call all action defined in this class and with any additional code after that you can add functionality
        super.roar()
        
        println("Lion Cub: Growl Growl")
        
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
        }
}
