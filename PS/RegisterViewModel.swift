//
//  RegisterViewModel.swift
//  PS
//
//  Created by Alexandr on 20.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

protocol RegisterView {}

class RegisterViewModel: AnyObject {
    
    let view: RegisterView
    
    init (view: RegisterView) {
        self.view = view
    }
    
    internal func register (email:String, password:String){
        
        let uuid = NSUUID().UUIDString
        
        BackendManager.signUp(uuid, email: email, password: password) { (success, error) -> Void in
            print("signup")
        }
    }
}
