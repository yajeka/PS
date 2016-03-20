//
//  AddPatnerController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class AddPatnerController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App partner"

        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }

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
