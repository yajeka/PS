//
//  initialController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class InitialController: UIViewController {
    
    @IBOutlet weak var pSImage: UIImageView!
    @IBOutlet weak var createAcountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    let kToCreateCredentionsSeg = "toCreateCredentionsSeg"
    let initialViewModel:MainViewModel = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        createAcountButton.setBackgroundImage(UIImage(named: "button_login_pressed")!, forState: .Highlighted)
        signInButton.setBackgroundImage(UIImage(named: "button_login_pressed")!, forState: .Highlighted)
        
        self.initialViewModel.runMainModel()
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        performSegueWithIdentifier(kToCreateCredentionsSeg, sender: sender)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == kToCreateCredentionsSeg {
            let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
        }
        
    }
    
    
}
