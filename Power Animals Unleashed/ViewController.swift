//
//  ViewController.swift
//  Power Animals Unleashed
//
//  Created by Nauru on 2/2/18.
//  Copyright © 2018 Scott Daly. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


// ...


class ViewController: UIViewController,GIDSignInUIDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().signInSilently()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleSignInClicked(_ sender: Any) {
        if GIDSignIn.sharedInstance().currentUser != nil {
            print("pre: \(GIDSignIn.sharedInstance().currentUser.profile.email!)")
        }
        else{
            print("not logged in yet")
        }
        print("button pressed")
        GIDSignIn.sharedInstance().signIn()
        if GIDSignIn.sharedInstance().currentUser != nil {
            print(GIDSignIn.sharedInstance().currentUser.profile.email!)
        }
        
    }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      print("entering sign in")
        if let error = error {
            print("error signing in: \(error)")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
            
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print("error authorizing: \(error)")
                    return
                }
                print("user signed in to firebase!")
                // ...
            }
    }
        
       
    
        
        
}


    
    
    


