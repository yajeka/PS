//
//  TabBarController.swift
//  PS
//
//  Created by Yauheni Yarotski on 20.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        if count == 0 {
            self.selectedIndex = 0
        } else {
        count = 0
            selectedIndex = 3
        }

    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
