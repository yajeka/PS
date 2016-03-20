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
    
    private class func handleResult(result: AnyObject? , error: NSError?, block: BackedBlock?, className: String) {
        if result is String {
            block!(success: nil, error: result as? String)
        } else if  let input = result as? NSDictionary {
            let query = PFQuery(className: className);
            do {
                let objectId = input["objectId"] as! String
                
                let task = query.getObjectInBackgroundWithId(objectId)
                
                task.waitUntilFinished()
                
                let object:PFObject = task.result as! PFObject
                
                block!(success: object, error: nil)
            } catch {
                block!(success: nil, error: "error")
            }
        }
    }
    
    public class func signUp(uid: String, email: String, password: String,  block: BackedBlock?) {
    }
    
    public class func findByEmailAndPassword(email: String, password: String,  block: BackedBlock?) {
        PFCloud.callFunctionInBackground("findByEmailAndPassword", withParameters: ["email": email, "password": password], block: {(result: AnyObject? , error: NSError?) -> Void in
                handleResult(result,error: error, block: block, className: "Account")
            });
    }

    
    public class func findByUid(uid: String, block: BackedBlock?) {
        PFCloud.callFunctionInBackground("findByUid", withParameters: ["uid": uid], block: {(result: AnyObject? , error: NSError?) -> Void in
            handleResult(result,error: error, block: block, className: "Account")
        });
    }
    
    public class func findByEmailAndPassword(email: String, password: String) -> BFTask {
        return PFCloud.callFunctionInBackground("findByEmailAndPassword", withParameters: ["email": email, "password": password]);
    }


    private class func findByUid(uid: String) -> BFTask {
        return PFCloud.callFunctionInBackground("findByUid", withParameters: ["uid": uid]);
    }
    
}
