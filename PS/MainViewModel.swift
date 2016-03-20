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
    func showUserWithInfo(userInfo:Dictionary<String,String>)
    func openRegisterUserScreen()
}

class MainViewModel: NSObject {
    
    let view: MainView
    
    init (view: MainView) {
        self.view = view
    }
    
    internal func runMainModel() {
        
        self.initParse()
        self.checkAccount()
    }
    
    private func initParse() {
        Parse.setApplicationId("lARUxNeUrMj0KQxltNnBwzhpkhrpUpEXuUTfr1Ca", clientKey: "kmrT8qwZxJzKLJewJBzVH2MM85nHFCO0AyY5lBIv")
    }
    
    private func checkAccount () {
        let uuid = NSUUID().UUIDString

        BackendManager.findByUid(uuid) { (result: AnyObject?, error: NSError?) -> Void in
            self.view.openRegisterUserScreen()
        }
    }
    
}
