//
//  BackendManager.swift
//  PS
//
//  Created by Andrey Koyro on 20/03/2016.
//  Copyright © 2016 hackathon. All rights reserved.
//

import Foundation
import Parse

public class BackendManager {
//    public class func signUp(uid: String, email: email, password: password) {
//        findByUid(<#T##uid: String##String#>, block: <#T##PFIdResultBlock?##PFIdResultBlock?##(AnyObject?, NSError?) -> Void#>)
//    }
    
    public class func findByUid(uid: String, block: PFIdResultBlock?) {
        PFCloud.callFunctionInBackground("findByUid", withParameters: ["uid": uid], block: block);
    }
}
