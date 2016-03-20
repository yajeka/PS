//
//  AddPatnerController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class AddPatnerController: UIViewController {
    
    @IBOutlet weak var addPhotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App partner"

        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        addPhotoButtonConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPhotoButtonConfig() {
        //        if let image = addPhotoButton.imageView?.image {
        addPhotoButton.layer.cornerRadius = 40
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.layer.borderWidth = 3
        addPhotoButton.layer.borderColor = UIColor.whiteColor().CGColor
        addPhotoButtonChangeImage(UIImage(named: "girl")!)
        
        //        }
    }
    
    func addPhotoButtonChangeImage(newImage:UIImage) {
        addPhotoButton.setImage(newImage, forState: .Normal)
        addPhotoButton.setBackgroundImage(newImage, forState: .Normal)
    }
    
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Master", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc?.hidesBottomBarWhenPushed = false
        presentViewController(vc!, animated: true, completion: nil)
        

        
    }
}
