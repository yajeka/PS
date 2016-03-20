//
//  MainViewModel.swift
//  PS
//
//  Created by Alexandr on 20.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit
import Parse

protocol MainView {
    func startInitial()
    func openLoginScreen()
    func openRegisterUserScreen()
}

class MainViewModel: AnyObject {
    
    let view: MainView
    let appID = "lARUxNeUrMj0KQxltNnBwzhpkhrpUpEXuUTfr1Ca"
    let clientKey = "kmrT8qwZxJzKLJewJBzVH2MM85nHFCO0AyY5lBIv"
    
    init (view: MainView) {
        self.view = view
    }
    
    internal func runMainModel() {
        
        self.initParse()
        self.checkAccount()
    }
    
    private func initParse() {
        Parse.setApplicationId(appID, clientKey: clientKey)
    }
    
    private func checkAccount () {
        let uuid = NSUUID().UUIDString

        self.view.startInitial()

        BackendManager.findByUid(uuid) { (success: PFObject?, error: String?) -> Void in
            if error != nil {
                self.view.openRegisterUserScreen()
            } else if success != nil {
                self.view.openLoginScreen()
            }
        }
    }
    
}
