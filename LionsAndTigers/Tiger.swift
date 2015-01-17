//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Christian Köhler on 05.11.14.
//  Copyright (c) 2014 Christian A. Köhler. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage (named: "")
    
    
    func chuff(){
        println("Tiger: Chuff Chuff")
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    
    }
    
    //Auch wenn man zwei Funktionen den gleichen Namen gibt sind diese unterschiedlich, da sie anderen Parameter beinhalten, im Vergleich zu ersten Funktion enthält diese hier "isLoud : Bool" als weiteren Parameter was sie von der ersten unterscheidet
    func chuffANumberofTimes (numberOfTimes: Int, isLoud : Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++
        {
            if isLoud {
                chuff()
            }
            else {
                println ("Tiger: purr purr")
            }
        }
    
    }
    
    func ageInTigersYearFromAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
        // hier könnte auch nur die eine Zeile stehen return regularAge *3, aber wir belassen es bei den zwei Zeilen, damit die Schritte klarer werden
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
            
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        
        return randomFact
    }
    
    
}