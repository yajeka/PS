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
    }
    
}
