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
    public class func signUp(uid: String, email: String, password: String,  block: PFIdResultBlock?) {
        
    }
    
    public class func findByEmailAndPassword(email: String, password: String,  block: PFIdResultBlock?) {
        PFCloud.callFunctionInBackground("findByEmailAndPassword", withParameters: ["email": email, "password": password], block: block);
    }

    
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
