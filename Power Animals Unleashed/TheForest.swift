//
//  TheForest.swift
//  Power Animals Unleashed
//
//  Created by Administrator on 2/8/18.
//  Copyright © 2018 Scott Daly. All rights reserved.
//

import UIKit
import SVProgressHUD

class TheForest: UIViewController {

    
    @IBAction func forestClick(_ sender: UIButton) {
        
            }
    
    
    @IBOutlet weak var forestEnable: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        forestEnable.isEnabled = false
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert = UIAlertController(title: "Look deep inside", message: "When you feel your Power Animal Stir deep inside your soul, tap on the screen to call out to the Forest of Spirits.", preferredStyle: .alert)
    
        let understandAction = UIAlertAction(title: "I Understand", style: .default, handler: { (UIAlertAction) in
        self.forestEnable.isEnabled = true
        })
    
    
        alert.addAction(understandAction)
    
        present(alert, animated: true, completion: nil)
    }

}
