//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Christian Köhler on 05.11.14.
//  Copyright (c) 2014 Christian A. Köhler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    //Set an array for my tigers which is empty but exists and can contain instances of serveral tigers
    var myTigers:[Tiger] = []
    
    //Set an array for  lions which is empty but exists and can contain insatnces of serveral lions
    var lions:[Lion] = []
    
    //Set an array for  lionCubs which is empty but exists and can contain insatnces of serveral lionCubs - it woild also be possible to store the lionCubs in the lion array as this is the superclass, but to keep it clean we leave each subclass with its own array
    var lionCubs:[LionCub] = []
    
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage (named: "BengalTiger.jpg")
        //hier können wir aus der tiger.swift das korrekte Alter ausgeben indem wir die Funktion ageInTigerYearsFromAge
        myTiger.age = myTiger.ageInTigersYearFromAge(myTiger.age)
        
        
        //Funktion aufrufen Tiger chuffs
        myTiger.chuff()
        myTiger.chuffANumberofTimes(3, isLoud: false)
        
        //add instance "myTiger" into the array myTigers
        self.myTigers.append(myTiger)
        
        println("My Tiges name is \(myTiger.name), it's age is \(myTiger.age), it's breed is \(myTiger.breed) and it's image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage (named: "IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigersYearFromAge(secondTiger.age)
        secondTiger.chuff()

        var thirdTiger = Tiger ()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage (named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigersYearFromAge(thirdTiger.age)
        
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage (named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigersYearFromAge(fourthTiger.age)
        
        
        //adding multiple instances of tiger, we created before to an array using shorthand +=
       self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
       myTiger.chuffANumberOfTimes(3)
       secondTiger.chuffANumberOfTimes(2)
        
        //adding a lion instance
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufase"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        //call the function roar defined in the class Lion 
        lion.roar()
        lioness.roar()
        
        //call of the function changeToAlphaMale defined in class Lion, changes a property wihtin a class
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        

        //adding multiple instances of lion, we created before to the array "lions" using shorthand +=

        self.lions += [lion, lioness]
        
        //adding the subclass LionCub with an instance
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.name = "Simba"
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionsBelly()
        
        //add another LionCub instance
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }
 
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
            
        }
    }
    
    func updateView () {
        
              UIView.transitionWithView(self.view, duration: 2, options:UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                if self.currentAnimal.species == "Tiger" {
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.myImageView.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                    self.randomFactLabel.text = tiger.randomFact()
                 }
                else if self.currentAnimal.species == "LionCub" {
                    let lionCub = self.lionCubs[self.currentAnimal.index]
                    self.myImageView.image = lionCub.image
                    self.breedLabel.text = lionCub.subspecies
                    self.ageLabel.text = "\(lionCub.age)"
                    self.nameLabel.text = lionCub.name
                    self.randomFactLabel.text = lionCub.randomFact()
                }
                else if self.currentAnimal.species == "Lion" {
                    let lion = self.lions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                    self.randomFactLabel.text = lion.randomFact()
                }

                
                self.randomFactLabel.hidden = false
                
                
            },
            completion: {
                (finished: Bool) -> () in
        })

    
    }
    
}

