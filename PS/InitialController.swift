//
//  initialController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class InitialController: UIViewController, MainView {
    
    @IBOutlet weak var pSImage: UIImageView!
    @IBOutlet weak var createAcountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    let kToCreateCredentionsSeg = "toCreateCredentionsSeg"
    
    private lazy var initialViewModel:MainViewModel = {
        return MainViewModel.init(view: self)
    }()
    
    
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
    
    // MARK: - MainView implementation
    
    func startInitial() {
        // TODO: implement progress view for find and login user
    }
    
    func showUserWithInfo(userInfo: Dictionary<String, String>) {
        // TODO: implement open new screen with show user
    }
    
    func openRegisterUserScreen() {
        // TODO: implement open screen to register user
    }
}
