//
//  MyProfileController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class MyProfileController: UIViewController {
    
    let kToAddPatnerSeg = "toAddPatnerSeg"

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var sexualOrienationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My profile"
        
        nameTextField.becomeFirstResponder()
        
        nameTextField.text = ""
        lastNameTextField.text = ""
        birthDateTextField.text = ""
        genderTextField.text = ""
        sexualOrienationTextField.text = ""
        
        
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier(kToAddPatnerSeg, sender: sender)
    }
    
    @IBAction func addPhotoButtonPressed(sender: UIButton) {
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == kToAddPatnerSeg {
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
            
        }
    }


}
