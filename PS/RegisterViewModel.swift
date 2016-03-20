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
}
