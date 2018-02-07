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


class ViewController: UIViewController, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                // ...
                return
            }
            print("User is signed in")
            // ...
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleSignInClicked(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
    


}
    
    
    


