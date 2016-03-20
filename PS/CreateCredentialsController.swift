//
//  CreateCredentialsController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class CreateCredentialsController: UIViewController, UITextFieldDelegate, RegisterView {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let kToMyProfileSeg = "toMyProfileSeg"
    
    private lazy var initialViewModel:RegisterViewModel = {
        return RegisterViewModel.init(view: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Creat new account"
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        emailTextField.text = ""
        passwordTextField.delegate = self
        passwordTextField.text = ""
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

    }
    
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier(kToMyProfileSeg, sender: sender)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField === emailTextField {
            if emailTextField.text?.characters.count > -1 {
                passwordTextField.becomeFirstResponder()
            }
            
        } else if textField === passwordTextField {
            if passwordTextField.text?.characters.count > -1 {
                //service calse and //        performSegueWithIdentifier(<#T##identifier: String##String#>, sender: <#T##AnyObject?#>)
                performSegueWithIdentifier(kToMyProfileSeg, sender: textField)
            }
        }
        return false
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == kToMyProfileSeg {
            let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
        }
        
    }

}
