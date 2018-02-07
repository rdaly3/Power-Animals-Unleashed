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


class ViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "1078301837907-j82qjbtscjrbjd407hkuouj24mnkhnbu.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    
    
    @IBAction func googleSignInPressed(_ sender: UIButton) {
        
        print("button pressed")
        print(GIDSignIn.sharedInstance().currentUser.profile.email!)
        GIDSignIn.sharedInstance().signIn()
        // Safe Present
        if GIDSignIn.sharedInstance().currentUser.profile.email != nil {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EnterTheForest") as? EnterTheForest
            {
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        print("Access token:", authentication?.accessToken!)
        
        let newViewController = EnterTheForest()
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }


}

