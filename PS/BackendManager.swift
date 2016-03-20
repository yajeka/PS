//
//  BackendManager.swift
//  PS
//
//  Created by Andrey Koyro on 20/03/2016.
//  Copyright © 2016 hackathon. All rights reserved.
//

import Foundation
import Parse

public typealias BackedBlock = (success: PFObject?, error: String?) -> Void

public class BackendManager {
    public class func signUp(uid: String, email: String, password: String,  block: BackedBlock?) {
    }
    
    public class func findByEmailAndPassword(email: String, password: String,  block: BackedBlock?) {
        PFCloud.callFunctionInBackground("findByEmailAndPassword", withParameters: ["email": email, "password": password], block: {(result: AnyObject? , error: NSError?) -> Void in
                if result is String {
                        block!(success: nil, error: result as? String)
                } else if  let input = result as? NSDictionary {
                    let object:PFObject = PFObject(className: "Account")
                    object["objectId"] = input["objectId"]
                    let task = object.fetchInBackground()
                    task.waitUntilFinished()
                    block!(success: object, error: nil)
                }
            });
    }

    
    
//    is Dictionary {
//    let object:PFObject = PFObject("Account");
//    object.
    

    
    public class func findByUid(uid: String, block: PFIdResultBlock?) {
        PFCloud.callFunctionInBackground("findByUid", withParameters: ["uid": uid], block: block);
    }
    
    public class func findByEmailAndPassword(email: String, password: String) -> BFTask {
        return PFCloud.callFunctionInBackground("findByEmailAndPassword", withParameters: ["email": email, "password": password]);
    }


    private class func findByUid(uid: String) -> BFTask {
        return PFCloud.callFunctionInBackground("findByUid", withParameters: ["uid": uid]);
    }
    
}
