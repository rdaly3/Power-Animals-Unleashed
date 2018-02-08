//
//  ViewController.swift
//  Power Animals Unleashed
//
//  Created by Nauru on 2/2/18.
//  Copyright © 2018 Scott Daly. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


// ...


class ViewController: UIViewController,GIDSignInUIDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "1078301837907-j82qjbtscjrbjd407hkuouj24mnkhnbu.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().signInSilently()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleSignInClicked(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
        
        
    }
    
    
    


}
    
    
    


