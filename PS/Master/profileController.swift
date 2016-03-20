//
//  profileController.swift
//  PS
//
//  Created by Yauheni Yarotski on 20.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class profileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        hidesBottomBarWhenPushed = false
//        [[self navigationController] setNavigationBarHidden:YES animated:YES];
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    
    @IBAction func createPostButtonPressed(sender: UIButton) {
        
        let sourceNVC = UIStoryboard(name: "Master", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("CreatePostViewControllerNav")
        
//        vc?.tabC = tabBarController
        presentViewController(sourceNVC, animated: true, completion: {
        let c = sourceNVC as? UINavigationController
            let b = c?.topViewController as? CreatePostViewController
            b?.tabC = self.tabBarController
            
        })
    }
    
}
