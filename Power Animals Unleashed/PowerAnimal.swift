//
//  PowerAnimal.swift
//  Power Animals Unleashed
//
//  Created by Administrator on 2/8/18.
//  Copyright © 2018 Scott Daly. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase


class PowerAnimal: UIViewController, GIDSignInUIDelegate {

    var animals : Array = ["Dolphin", "Fox", "Giraffe", "Hawk", "Lion", "Penguin", "Seal", "Tortoise"]
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var breatheIn: UILabel!
    
    @IBAction func signout(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance().signOut()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        

        let randomNum = Int(arc4random_uniform(UInt32(animals.count)))
        
        var animalName : String = animals[randomNum]
        
        animalImage.image = UIImage(named: animalName)
        
        breatheIn.text = "Breathe in deep and let the spirit of \(animalName) fill you."
        
    }
    
    
    
  

}
